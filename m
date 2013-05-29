Received: from mail-vc0-f170.google.com ([209.85.220.170])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhlOI-0005Gl-RV
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 18:46:31 +0000
Received: by mail-vc0-f170.google.com with SMTP id gf11so6703734vcb.1
 for <linux-mtd@lists.infradead.org>; Wed, 29 May 2013 11:46:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1369812433.5446.226.camel@sauron.fi.intel.com>
References: <CAKGbVbtp4FBauCFNGSPTQSk_Dz4ELa7Gn31UByTMaFSk_vF1eg@mail.gmail.com>
 <1369812433.5446.226.camel@sauron.fi.intel.com>
Date: Wed, 29 May 2013 11:46:05 -0700
Message-ID: <CAN8TOE-HM07jwizD_4JA-4E9DnbUDk-Zm8mKz6TALJmKAkg9ww@mail.gmail.com>
Subject: Re: UBI torture_peb() bad block detection problem
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Dunn <mikedunn@newsguy.com>, Richard Genoud <richard.genoud@gmail.com>,
 Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
 Qiang Yu <yuq825@gmail.com>, Ivan Djelic <ivan.djelic@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

On Wed, May 29, 2013 at 12:27 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sat, 2013-04-27 at 21:57 +0800, Qiang Yu wrote:
>> Hi guys,
>>
>> I'm writing MTD driver for Allwinner A10 nand controller. Now there is
>> a problem with the UBI torture_peb() function. From the code and UBI
>> doc, a PEB will be treated as bad when read with bit-flip after erase.
>
> The assumption that the MTD driver covers empty ereaseblocks with ECC,
> so the erased areas are also protected. And the driver reports bit-flips
> only if the amount of bits flipped is above the "safe" threshold, see
> 'mtd_read()':
>
> return ret_code >= mtd->bitflip_threshold ? -EUCLEAN : 0;
>
> So, your driver tells UBI: hey, this area has a dangeours amount of
> bit-flips. And UBI knows that it just erased it, so the reaction is -
> let me assume it is bad.

Note that there are kind of 3 classes of "bitflips" here:
1. A number of bitflips that are under the threshold. ECC corrects
this "easily," and we report no error
2. A number of bitflips that is above the threshold, but still
correctable by ECC (this returns EUCLEAN)
3. A number of bitflips that is above the correctability of the ECC
algorithm (an "ECC error", returning EBADMSG)

However, we break this classification if (as is being discussed here)
the ECC algorithm does not properly protect empty pages. For such ECC,
I expect that all bitflips will actually be reported as uncorrectable
(class 3, EBADMSG).

> So you should invent something in your driver to make it protect empty
> NAND pages. Try to google, there were discussions about this.

I don't think this should always be done by the driver. As this is not
the first driver to need such support, I think we should do something
about it in nand_base.c. In fact, I was already considering submitting
some work to handle this problem soon.

BTW, here is some prior discussion:

http://lists.infradead.org/pipermail/linux-mtd/2012-July/042818.html
http://lists.infradead.org/pipermail/linux-mtd/2011-February/034139.html

>> But with SAMSUNG K9GBG08U0A flash chip, sometimes the bit-flip does
>> happen even after being erased.
>
> The assumption is that it should be corrected by ECC. -EUCLEAN should
> not be reported if it is harmless. It should only be reported if there
> are too many bit-flips.

I am guessing that where Qiang is speaking of bitflips, these actually
turn up as EBADMSG (ECC error) and not as EUCLEAN, right? So the
discussion should be about avoiding EBADMSG and instead returning
EUCLEAN (or just 0, if we're under the threshold).

Now, assuming Qiang's problem is pretty similar to mine, a solution
could work like the following:

1. If nand_base receives an EBADMSG error code from a driver, do steps
2 through 5, for each ECC sector in the page
2. Count the number of 0 bits in the ECC sector (call it 'numzeros')
3. If numzeros > ecc_strength, return EBADMSG
4. Otherwise, clear the sector data to 0xff ("correcting" the sector)
5. Repeat 2-4 for each sector. If all sectors are "corrected", then
return the max bitflips per sector

The above algorithm is not ideal for running often in SW, but
fortunately, it would only be run for the uncommon case for a few
reasons:
[a] UBI shouldn't regularly need to read erased pages. This is
primarily (only?) used for recovery from power-cuts.
[b] Even when reading erased pages, we shouldn't see these flips "too
often." I don't have hard numbers right now, but I don't believe we
get these flips anywhere near 50% of the time when reading erased
pages. Of course, this also varies depending on the (un)reliability of
the flash medium.
[c] For other EBADMSG (i.e., truly-corrupt data, not an erased page),
we would quickly error out after seeing a few bytes of non-FFh data

All of this could be an opt-in feature for nand_base.c, where drivers
can flag something like NAND_CHECK_FF_BITFLIPS (or some better-named
flag).

Some form of this algorithm has already improved this very situation
in my own out-of-tree driver, but I feel like it will be useful to
include it in the generic code, rather than implementing ad-hoc
solutions for every piece of hardware which uses an inflexible ECC
scheme. (Of course, the best way is still to fix the ECC
encoder/decoder to correct FFh pages, IMO.)

Thoughts?

Brian
