Received: from yx-out-1718.google.com ([74.125.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kj5up-0005No-5o
	for linux-mtd@lists.infradead.org; Fri, 26 Sep 2008 05:30:55 +0000
Received: by yx-out-1718.google.com with SMTP id 3so270109yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Sep 2008 22:30:54 -0700 (PDT)
Message-ID: <9c9fda240809252230s6373acf8v4dd2b942eba360a7@mail.gmail.com>
Date: Fri, 26 Sep 2008 14:30:54 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: dedekind@infradead.org
Subject: Re: [ANNOUNCE] [PATCH] [MTD] Flex-OneNAND MTD Driver available.
In-Reply-To: <1222404711.5012.5.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <19198934.52871221827459790.JavaMail.weblogic@epml16>
	<9c9fda240809220011w49c0875q804f836550ff3476@mail.gmail.com>
	<000001c91e42$1aa86c50$3dd66c6b@sisodomain.com>
	<9c9fda240809251731y48272a63j988e0001dc50d78@mail.gmail.com>
	<1222404711.5012.5.camel@sauron>
Cc: apgmoorthy <moorthy.apg@samsung.com>, linux-mtd@lists.infradead.org,
	Kyungmin Park <kyungmin.park@samsung.com>,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

>>
>>
>> > diff -uprN a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
>> > --- a/include/mtd/mtd-abi.h     2008-09-16 20:48:12.000000000 +0530
>> > +++ b/include/mtd/mtd-abi.h     2008-09-24 14:09:06.000000000 +0530
>> > @@ -102,7 +102,11 @@ struct nand_oobinfo {
>> >        uint32_t useecc;
>> >        uint32_t eccbytes;
>> >        uint32_t oobfree[8][2];
>> > +#ifdef CONFIG_MTD_ONENAND
>> > +       uint32_t eccpos[128];
>> > +#else
>> >        uint32_t eccpos[32];
>> > +#endif
>> >  };
>> >
>> >  struct nand_oobfree {
>> > @@ -117,7 +121,11 @@ struct nand_oobfree {
>> >  */
>> >  struct nand_ecclayout {
>> >        uint32_t eccbytes;
>> > +#ifdef CONFIG_MTD_ONENAND
>> > +       uint32_t eccpos[128];
>> > +#else
>> >        uint32_t eccpos[64];
>> > +#endif
>> >        uint32_t oobavail;
>> >        struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES];
>> >  };
>
> I do not think stuff like this is going to be accepted because you
> change ABI. You should instead introduce new ioctls or add sysfs
> support and expose this information via sysfs. This is much bigger
> work, but it is needed.
>

Thank you for your kind comments.

Yes that's I concerned it breaks the other NAND ABI. Actually In
OneNAND it doesn't use eccpos since OneNAND controller handle all ECC
functions. we don't need to concern it.

As pages are bigger, it requires more eccpos and other fields are
similar. we need more flexible filed definitions.

Well how do you think that at this time it only describes the 64 bytes
only for temporarily and next time it adds remaining parts if it is
really needed.

Thank you,
Kyungmin Park
