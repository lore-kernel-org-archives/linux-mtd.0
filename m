Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr9VA-0001Ec-Pr
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 19:01:46 +0000
Received: by obcqt19 with SMTP id qt19so178623774obc.3
 for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2015 12:01:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <562E9E0B.5030204@nod.at>
References: <CAJ+vNU3eu4qBxaZpDRY=Fidv=9iGmA5pq8b4yUfyBayLTos5oQ@mail.gmail.com>
 <562E8697.50207@nod.at>
 <CAJ+vNU1J+MvyWgY1FPv4G7TxQLDtPJWdWw=DP5+1h2HcTi-SxQ@mail.gmail.com>
 <562E9E0B.5030204@nod.at>
Date: Tue, 27 Oct 2015 12:01:23 -0700
Message-ID: <CAJ+vNU1GV1GxYfLgHh2ZerAGjRxi=azXHLg_dNO=BaUrkkDU1w@mail.gmail.com>
Subject: Re: UBIFS corruption after power cut - possibly unstable bits issue?
From: Tim Harvey <tharvey@gateworks.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 26, 2015 at 2:41 PM, Richard Weinberger <richard@nod.at> wrote:
> Tim,
>
> Am 26.10.2015 um 21:31 schrieb Tim Harvey:
>> What would be causing the bit-flips on the erased pages? Could it have
>> something to do with the larger flash part having a much longer erase
>> time?
>
> According to NAND manufactures can happen also on empty space.
> At the time when UBIFS was designed this was not known nor was it observed.
> These days it seems to happen on some large/cheap NANDs.
>

Richard,

I'm not understanding what is making you say that the issue I
encountered is 'not' the unstable bits issue described at
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits? My
understanding is that the 'unstable bit' issue refers to bits which
are truly unstable and can read either way each and every read due to
not getting properly erased/written.

If I understand what you are saying you are thinking that my issue is
instead the result of a never-used PEB that had bit-flips from the
manufacturer in which case the bits would read the same every time?
How can we know this PEB was never before used and isn't one that was
being erased/written during a power cut?

In my test scenario where the rootfs is mounted from the kernel
read-only, but later mounted read-write by userspace (yet not being
specifically written to by userspace) then power-cut should 'any' NAND
writes would be occurring at all? And if not as I suspect, then how
could a subsequent boot end up using a PEB that may have been never
previously used and have bit-flips from the manufacturer?

Should we be doing an erase block on every NAND block during our board
manufacturing process to avoid this?

It sounds like this 'unexpected bit-flips on erased pages from the
mfg' issue is a ticking time-bomb for people using ubi/ubifs NAND.
Shouldn't the http://www.linux-mtd.infradead.org/doc/ubifs.html page
be updated to refer to this known issue as well as the unstable bit
issue?

>> There shouldn't be anything writing to ubifs so I'm not clear what
>> caused this to occur. Note that even if I remove the /etc/fstab that
>> causes root to be re-mounted read/write I always see 'UBIFS (ubi0:0):
>> recovery needed' and I'm not understanding what causes that but it
>> makes me think that NAND is getting touched each and every boot by the
>> recovery process.
>>
>>> In March there was an attempt to fix that in software.
>>> But no mainline ready solution was presented so far:
>>> http://lists.infradead.org/pipermail/linux-mtd/2014-March/052521.html
>>>
>>> It is not clear whether to implement this directly in gpmi-nand or MTD core.
>>> Currently UBIFS assumes that empty spaces must contain only 0xff octets.
>>> A naive approach would be removing that check from UBIFS, bit this can have
>>> disastrous consequences as UBIFS's recovery algorithm relies on that.
>>
>> I think I ran across that approach right before the thread you pointed
>> me to: http://thread.gmane.org/gmane.linux.drivers.mtd/52208
>
> :-)
>
>> the second case is not permanent corruption - when the system is
>> power-cycled it comes up fine the next time.
>
> Yeah, but have you checked how the temporary corruption looks like?

I can add some debugging to find out - what specifically would be
helpful to add?

Thanks for the help!

Tim
