Received: from eu1sys200aog105.obsmtp.com ([207.126.144.119])
 by merlin.infradead.org with smtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeR1n-00016l-ON
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 14:57:49 +0000
Message-ID: <527BAA32.3020901@st.com>
Date: Thu, 7 Nov 2013 14:56:50 +0000
From: Angus Clark <angus.clark@st.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
 <4FFBDDB0.6010605@parrot.com>
 <CAN8TOE8g9FjgJuj+1RuQx3afaY_Huo29PZBNvXVt2-p17OF_tQ@mail.gmail.com>
In-Reply-To: <CAN8TOE8g9FjgJuj+1RuQx3afaY_Huo29PZBNvXVt2-p17OF_tQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Angus CLARK <angus.clark@st.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Ivan Djelic <ivan.djelic@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Firstly, apologies for dragging up an issue that dates back well over a year!

While preparing to upstream an out-of-tree NAND driver, we have fallen foul of
the change from MTD_OPS_RAW to MTD_OPS_PLACE_OOB in nand_bbt.c:scan_read_oob().

One issue relates to what is at best a hack within our own driver, and that is
for us to deal with :-)  However, I also have a concern that the patch could
result in genuine bad blocks escaping detection.

As I understand it, the patch was attempting to address the following situation:
    - NAND-resident BBTs are not used.
    - The BBT is re-created on each boot by scanning for MBBM.
    - A page write yields one or more bit-flips in the location used for the
MBBM, resulting in non-0xff data being present.
    - The non-0xff data is then misinterpreted as a MBBM on a subsequent boot,
giving a false bad-block.

In cases where the ECC scheme covers the MBBM location, then I can see that
enabling the ECC would cause the non-0xff data to be corrected, and therefore
avoid the block being falsely identified as bad.

However, I can also construct a situation where a genuine MBBM gets "corrected"
to 0xff.  Consider, for example, an 8-bit ECC scheme covering the MBBM location,
where the ECC for a sector of all 0xff data is also all 0xff.  In this case, a
MBBM of 0x00, with the remaining data all 0xff, would get "corrected" to 0xff.
Although perhaps a slightly contrived example, the S/W BCH ECC included in the
kernel scheme can be driven in this way, and I have seen blocks marked as bad
with this pattern in the past.

It is difficult to know if your particular system could suffer in this way.  It
all depends on the nature of your ECC scheme.  I guess my concern is that the
patch deviates from what is recommended by the NAND manufacturers, and that it
makes certain assumptions on how the ECC scheme operates.

My own view is that the only safe way to record and track bad blocks is to use
NAND-resident BBTs; after all, if a block is bad then there is no guarantee that
an attempt to write a MBBM would succeed.  NAND-resident BBTs would also avoid
the problem the patch was attempting fix in the first place.

Cheers,

Angus


On 07/13/2012 06:39 PM, Brian Norris wrote:
> On Tue, Jul 10, 2012 at 12:45 AM, Matthieu CASTET
> <matthieu.castet@parrot.com> wrote:
>> Brian Norris a écrit :
>>> scan_read_raw_oob() is used in only in places where the MTD_OPS_PLACE_OOB
>>> mode is preferable MTD_OPS_RAW mode, so use MTD_OPS_PLACE_OOB instead.
>>> MTD_OPS_PLACE_OOB provides the same functionality with the potential[1]
>>> added bonus of error correction.
>>>
>>> This brings scan_block_full() in line with scan_block_fast() so that they
>>> both read bad block markers with MTD_OPS_PLACE_OOB. This can help in
>>> preventing 0xff markers (in good blocks) from being interpreted as bad
>>> block indicators in the presence of a single bitflip.
>>
>> As far I understand the code, this work when "chip->ecc.read_oob" (used in
>> nand_do_read_oob) correct bit flip.
>>
>> But I see no "chip->ecc.read_oob" implementation that can return bit flip. Is
>> that expected ?
> 
> I have an out-of-tree driver that corrects OOB bitflips. Is there
> really no other HW out there that corrects OOB errors?
> 
> Anyway, I understand that my driver is an outlier here, but I don't
> see a real disadvantage in these changes. But on the positive side, I
> expect that in the future, more drivers/HW will either want to stop
> using OOB for anything at all or will want ECC protection for OOB.
> 
>> This can also work when nand_do_read_ops is used (ops->datbuf != NULL). But it
>> is hard to see case where it can correct bit flip in bad block marker. Do you
>> have any exemple ?
> 
> First of all, this has no effect if the driver does not protect OOB
> with ECC (i.e., for OOB-only reads, MTD_OPS_PLACE_OOB == MTD_OPS_RAW).
> So the following argument only applies when OOB is ECC-protected.
> 
> Consider a *good* block that is written with filesystem data. On
> bootup, Linux may scan this block's BBM to check if it is bad. If a
> bitflip occurs in the bad block marker, then it may be erroneously
> considered bad.
> 
> Similarly, if a block was marked bad from wear (not factory-marked),
> then its BBM may be written along with ECC protection. Then, when we
> scan for bad blocks, it will be protected from bitflips that could
> possibly cause 0x00 to appear non-zero. (This is not a big issue,
> since 'non-zero' is still bad, as long as 0x00 didn't flip to 0xff -
> quite unlikely...)
> 
>> PS : Did you have any comment on
>> http://thread.gmane.org/gmane.linux.drivers.mtd/42243 ?
> 
> I read it, and it seems promising. I agree with much of the premise
> (that nand_bbt.c is ugly and repetitive at times) but haven't had
> enough time to review properly. Sorry. I'm a bit backlogged and will
> be for a few weeks, I think. But I'll see what I can do.
> 
> Thanks,
> Brian
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
-------------------------------------
Angus Clark
ST Microelectronics (R&D) Ltd.
1000 Aztec West, Bristol, BS32 4SQ
email: angus.clark@st.com
tel: +44 (0) 1454 462389
st-tina: 065 2389
-------------------------------------
