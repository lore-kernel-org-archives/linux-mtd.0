Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MDXZ5-0004vJ-R1
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 05:38:42 +0000
Received: by fxm8 with SMTP id 8so3035096fxm.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 07 Jun 2009 22:38:34 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH] nand/s3c2410: s3c2410_nand_setrate(): use correct macros
	for 2412/2440
References: <1244379863-23581-1-git-send-email-jacmet@sunsite.dk>
	<1244438907.5847.323.camel@localhost.localdomain>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 08 Jun 2009 07:38:32 +0200
In-Reply-To: <1244438907.5847.323.camel@localhost.localdomain> (Artem
	Bityutskiy's message of "Mon\, 08 Jun 2009 08\:28\:27 +0300")
Message-ID: <87ocszuvxj.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: wookey@wookware.org, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, ben-linux@fluff.org,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Artem" == Artem Bityutskiy <dedekind@infradead.org> writes:

 Artem> On Sun, 2009-06-07 at 15:04 +0200, Peter Korsgaard wrote:
 >> Use the correct S3C2440_NFCONF_* macros for the mask for the 2412/2440
 >> variants instead of the 2410 ones which use wrong bit positions.
 >> 
 >> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

 Artem> Your patch is already in the mtd-2.6.git tree.

Ahh, sorry - Missed that. I resent it as it is a prerequisite to the
s3c64xx support to the driver I sent yesterday.

That patch seems to have never made it to the list though, so I will
resend.

-- 
Bye, Peter Korsgaard
