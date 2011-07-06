Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeMT1-00023c-BL
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2011 07:24:16 +0000
Received: by iwn35 with SMTP id 35so7165947iwn.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jul 2011 00:22:17 -0700 (PDT)
Subject: Re: [PATCH v3] mtd: eLBC NAND: remove elbc_fcm_ctrl->oob_poi
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
Date: Wed, 06 Jul 2011 10:23:13 +0300
In-Reply-To: <1309907688-8235-1-git-send-email-mlcreech@gmail.com>
References: <1309905302-1990-1-git-send-email-mlcreech@gmail.com>
	<1309907688-8235-1-git-send-email-mlcreech@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309937003.3149.83.camel@sauron>
Mime-Version: 1.0
Cc: scottwood@freescale.com, linuxppc-dev@lists.ozlabs.org,
	linux-mtd@lists.infradead.org, mhench@elutions.com, rick22@wi.rr.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-07-05 at 19:14 -0400, Matthew L. Creech wrote:
> From: Mike Hench <mhench@elutions.com>
> 
> The eLBC NAND driver currently follows up each program/write operation with a
> read-back of the page, in order to [ostensibly] fill in ECC data for the
> caller. However, the page address used for this read is always -1, so the read
> will never work correctly.  Remove this useless (and potentially problematic)
> block of code.

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
