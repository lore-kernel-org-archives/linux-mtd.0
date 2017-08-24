Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkpP7-0003gJ-2b
 for linux-mtd@lists.infradead.org; Thu, 24 Aug 2017 10:30:27 +0000
Received: by mail-wm0-x242.google.com with SMTP id v186so2281605wmf.4
 for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2017 03:30:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170824120428.46e266c7@bbrezillon>
References: <1503394972-12541-1-git-send-email-andrea.adami@gmail.com>
 <20170822145424.54e57b94@bbrezillon>
 <CAAQYJAsTCy2nWYjMTmSGqSCn-ttWJ5H8LANmyaaVJ+mPs7x1bg@mail.gmail.com>
 <20170824120428.46e266c7@bbrezillon>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 24 Aug 2017 12:30:02 +0200
Message-ID: <CAAQYJAtkHGO1-5mQsgmAA=Q6oOuN0e=OaNftXE=iKBoUYBs8Kg@mail.gmail.com>
Subject: Re: [PATCH v6] mtd: sharpslpart: Add sharpslpart partition parser
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 24, 2017 at 12:04 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Thu, 24 Aug 2017 11:19:56 +0200
> Andrea Adami <andrea.adami@gmail.com> wrote:
>
>> >> +/**
>> >> + * struct sharpsl_ftl - Sharp FTL Logical Table
>> >> + * @logmax:          number of logical blocks
>> >> + * @log2phy:         the logical-to-physical table
>> >> + *
>> >> + * Stripped down from 2.4 sources for read-only purposes.
>> >
>> > Not sure this information is really useful, especially since you don't
>> > provide a link to the 2.4 sources (or maybe I missed it).
>>
>> Maybe here I can add that this FTL was originally tailored for devices
>> 16KiB erasesize matching the size of the PARAM_BLOCK_ above thus using
>> two separate blocks for the partition tables. Should I add an
>> ASCII-art?
>
> You can add an ASCII-art if you want but that's not mandatory if you
> can explain it with words :-).
>
>> Pls see
>> http://www.h5.dion.ne.jp/~rimemoon/zaurus/memo_006.htm
>> BTW the link was in the cover-letter 0/9, I'll put it here together
>> with the changelog.
>
> Please put it in the code (in a comment). The changelog will disappear
> as soon as I apply the patch.
>
>>
>> >
>> > You'd better describe what this struct is used for here.
>> Seems self-explanatory..2 fields commented. What would you add here?
>
> Just that the struct contains the logical-to-physical translation
> table used by the SHARPSL FTL. It's just that your initial comment
> didn't bring any useful information.
>
>>
>> >
>> >> + */
>> >> +struct sharpsl_ftl {
>> >> +     u_int logmax;
>> >> +     u_int *log2phy;
>> >
>
> [...]
>
>> >> +/*
>> >> + * The logical block number assigned to a physical block is stored in the OOB
>> >> + * of the first page, in 3 16-bit copies with the following layout:
>> >> + *
>> >> + * 01234567 89abcdef
>> >> + * -------- --------
>> >> + * ECC BB   xyxyxy
>> >> + *
>> >> + * When reading we check that the first two copies agree.
>> >> + * In case of error, matching is tried using the following pairs.
>> >> + * Reserved values 0xffff mean the block is kept for wear leveling.
>> >> + *
>> >> + * 01234567 89abcdef
>> >> + * -------- --------
>> >> + * ECC BB   xyxy    oob[8]==oob[10] && oob[9]==oob[11]   -> byte0=8   byte1=9
>> >> + * ECC BB     xyxy  oob[10]==oob[12] && oob[11]==oob[13] -> byte0=10  byte1=11
>> >> + * ECC BB   xy  xy  oob[12]==oob[8] && oob[13]==oob[9]   -> byte0=12  byte1=13
>> >> + *
>> >> + */
>> >> +static u_int sharpsl_nand_get_logical_num(u_char *oob)
>> >> +{
>> >> +     u16 us;
>> >> +     int good0, good1;
>> >> +
>> >> +     if (oob[NAND_NOOB_LOGADDR_00] == oob[NAND_NOOB_LOGADDR_10] &&
>> >> +         oob[NAND_NOOB_LOGADDR_01] == oob[NAND_NOOB_LOGADDR_11]) {
>> >> +             good0 = NAND_NOOB_LOGADDR_00;
>> >> +             good1 = NAND_NOOB_LOGADDR_01;
>> >> +     } else if (oob[NAND_NOOB_LOGADDR_10] == oob[NAND_NOOB_LOGADDR_20] &&
>> >> +                oob[NAND_NOOB_LOGADDR_11] == oob[NAND_NOOB_LOGADDR_21]) {
>> >> +             good0 = NAND_NOOB_LOGADDR_10;
>> >> +             good1 = NAND_NOOB_LOGADDR_11;
>> >> +     } else if (oob[NAND_NOOB_LOGADDR_20] == oob[NAND_NOOB_LOGADDR_00] &&
>> >> +                oob[NAND_NOOB_LOGADDR_21] == oob[NAND_NOOB_LOGADDR_01]) {
>> >> +             good0 = NAND_NOOB_LOGADDR_20;
>> >> +             good1 = NAND_NOOB_LOGADDR_21;
>> >> +     } else {
>> >> +             /* wrong oob fingerprint, maybe here by mistake? */
>> >> +             return UINT_MAX;
>> >> +     }
>> >> +
>> >> +     us = oob[good0] | oob[good1] << 8;
>> >> +
>> >> +     /* parity check */
>> >> +     if (hweight16(us) & BLOCK_UNMASK_COMPLEMENT)
>> >> +             return (UINT_MAX - 1);
>> >
>> > Why not making this function return an int and use regular error codes
>> > for the parity and wrong fingerprint errors?
>> >
>> Originally in case of error it did return the largest values.
>> I can return a negative int but then I'd have to check for log_no >0
>>
>> Besides, what are the 'regular' error codes you'd use here?
>> For the missing FTL we do return -EINVAL later so I'd say this is the
>> error for the wrong oob fingerprint.
>
> EINVAL should be fine for all corruption/mismatch.
>
>>
>> About the parity error, it does return UINT_MAX -1 so to allow very
>> large log_num. This value is always bigger than log_max so it is
>> skipped in the actual code but the read continues.
>
> Well, a parity error is still an error, right?
>
>> Should we change the philosophy of the old 2.4 code and exit in case
>> of parity errors?
>
> Hm, you should not exit if the phys -> log information is corrupted, it
> just means you can't consider this physical block is containing a valid
> logical block, that's all. Pretty much like when there's an oob
> fingerprint mismatch.

For the partition parser purposes, we don't know in advance in which
physical block the partition tables are stored.
Maybe the parity is occurring on 'uninteresting'  blocks, so I'll go
head to maximize the probabilties to get the tables.

>
>>
>> >> +
>> >> +     /* reserved */
>> >> +     if (us == BLOCK_IS_RESERVED)
>> >> +             return BLOCK_IS_RESERVED;
>> >> +     else
>> >
>> > You can drop the 'else' here.
>> Done
>> >
>> >> +             return (us & BLOCK_UNMASK) >> 1;
>> >
>> > So, this is a 10bit value, right? Why not doing the >> 1 first so that
>> > your BLOCK_UNMASK mask really looks like a valid mask (0x3ff, which can
>> > also be defined as GENMASK(9, 0)).
>> Right, very nice. Done.
>> Can I keep BLOCK_UNMASK COMPLEMENT = 1 ?
>
> Yes.
>
>>
>> >
>> >> +}
>> >> +
>> >> +static int sharpsl_nand_init_logical(struct mtd_info *mtd, u32 partition_size,
>> >
>> > s/sharpsl_nand_init_logical/sharpsl_nand_init_ftl/
>> Oh yes, renamed
>>
>> >
>> > partition_size is always set to SHARPSL_FTL_PART_SIZE. Please drop this
>> > argument.
>> >
>> Ok, done
>>
>> >> +                                  struct sharpsl_ftl *ftl)
>> >> +{
>> >> +     u_int block_num, log_num, phymax;
>> >> +     loff_t block_adr;
>> >> +     u_char *oob;
>> >> +     int i, ret;
>> >> +
>> >> +     oob = kzalloc(mtd->oobsize, GFP_KERNEL);
>> >> +     if (!oob)
>> >> +             return -ENOMEM;
>> >> +
>> >> +     /* initialize management structure */
>> >> +     phymax = (partition_size / mtd->erasesize);
>> >
>> > You can use mtd_div_by_eb() here.
>> >
>> Done for all occurrences
>>
>> >> +
>> >> +     /* FTL reserves 5% of the blocks + 1 spare  */
>> >> +     ftl->logmax = ((phymax * 95) / 100) - 1;
>> >> +
>> >> +     ftl->log2phy = kmalloc_array(ftl->logmax, sizeof(u_int),
>> >
>> >                                                   sizeof(*ftl->log2phy)
>> Ok, changed.
>>
>> >
>> >> +                                  GFP_KERNEL);
>> >> +     if (!ftl->log2phy) {
>> >> +             ret = -ENOMEM;
>> >> +             goto exit;
>> >> +     }
>> >> +
>> >> +     /* initialize ftl->log2phy */
>> >> +     for (i = 0; i < ftl->logmax; i++)
>> >> +             ftl->log2phy[i] = UINT_MAX;
>> >> +
>> >> +     /* create physical-logical table */
>> >> +     for (block_num = 0; block_num < phymax; block_num++) {
>> >> +             block_adr = block_num * mtd->erasesize;
>> >> +
>> >> +             if (mtd_block_isbad(mtd, block_adr))
>> >> +                     continue;
>> >> +
>> >> +             if (sharpsl_nand_read_oob(mtd, block_adr, mtd->oobsize, oob))
>> >> +                     continue;
>> >> +
>> >> +             /* get logical block */
>> >> +             log_num = sharpsl_nand_get_logical_num(oob);
>> >> +
>> >> +             /* FTL is not used? Exit here if the oob fingerprint is wrong */
>> >> +             if (log_num == UINT_MAX) {
>> >> +                     pr_info("sharpslpart: Sharp SL FTL not found.\n");
>> >> +                     ret = -EINVAL;
>> >> +                     goto exit;
>> >> +             }
>
> Okay, I overlooked that part. Why do you exit if there's a fingerprint
> mismatch? Can't you just ignore this physical block and continue
> scanning the remaining ones?

Norris asked to quit immediately in this case.
https://patchwork.kernel.org/patch/9758361/

"I wouldn't expect people to want to use this parser, but if we have a
quick way to say "this doesn't match, skip me", then that would be
helpful."
"We don't want to waste too much time scanning for this partition
table if possible."

Now we are quitting ever before checking for parity erors ...

Cheers
Andrea
