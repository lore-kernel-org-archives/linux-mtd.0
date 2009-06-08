Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDXhz-0006P3-5K
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 05:47:54 +0000
Subject: Re: [PATCH] nand/s3c2410: s3c2410_nand_setrate(): use correct
	macros for 2412/2440
From: Artem Bityutskiy <dedekind@infradead.org>
To: Peter Korsgaard <jacmet@sunsite.dk>
In-Reply-To: <87ocszuvxj.fsf@macbook.be.48ers.dk>
References: <1244379863-23581-1-git-send-email-jacmet@sunsite.dk>
	<1244438907.5847.323.camel@localhost.localdomain>
	<87ocszuvxj.fsf@macbook.be.48ers.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Jun 2009 08:47:07 +0300
Message-Id: <1244440027.5847.324.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: wookey@wookware.org, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, ben-linux@fluff.org,
	linux-arm-kernel@lists.arm.linux.org.uk
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-06-08 at 07:38 +0200, Peter Korsgaard wrote:
> >>>>> "Artem" == Artem Bityutskiy <dedekind@infradead.org> writes:
> 
>  Artem> On Sun, 2009-06-07 at 15:04 +0200, Peter Korsgaard wrote:
>  >> Use the correct S3C2440_NFCONF_* macros for the mask for the 2412/2440
>  >> variants instead of the 2410 ones which use wrong bit positions.
>  >> 
>  >> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> 
>  Artem> Your patch is already in the mtd-2.6.git tree.
> 
> Ahh, sorry - Missed that. I resent it as it is a prerequisite to the
> s3c64xx support to the driver I sent yesterday.
> 
> That patch seems to have never made it to the list though, so I will
> resend.

It was trapped, but now approved.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
