Received: from mail-ew0-f205.google.com ([209.85.219.205])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N4IqY-0000Kt-Jb
	for linux-mtd@lists.infradead.org; Sat, 31 Oct 2009 18:38:48 +0000
Received: by ewy1 with SMTP id 1so3606944ewy.27
	for <linux-mtd@lists.infradead.org>;
	Sat, 31 Oct 2009 11:38:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
Date: Sat, 31 Oct 2009 13:38:39 -0500
Message-ID: <528f13590910311138s7c3b1551odfd363846dca0efb@mail.gmail.com>
Subject: Re: [RFC] mxc nand controller updates
From: alfred steele <alfred.jaquez@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Eric Benard <ebenard@eukrea.com>, Vladimir Barinov <vova.barinov@gmail.com>,
	mathieu.berland@eads.com, jbe@pengutronix.de,
	linux-mtd@lists.infradead.org, sha@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,


> Here are several patches for the mxc nand controller. At the end
> of this series we are able to use this driver with the i.MX25/35
> SoCs. Please review and test if you do not want to see your boards
> break ;)
Are these changes ported to u-boot yet.
Would this be able to support 4k page size NAND flash. I took the
latest snapshot from the U-boot GIT and trying to boot out of a 4K
NAND on this but haven't been succesful as of now.
I believe we used have a separate mxc_nand_load.S assembly code in
earlier u-boot v2.0 which would load the first 4k from the NAND to the
NFC  SRAM and then the rest of the uboot is loaded after SDRAM /DDR is
initialized. But with the lates code you have in uboot GIT, looks like
all this is done in C after a minimal stack is setup.

Please help me understand this better.

-Alfred.
