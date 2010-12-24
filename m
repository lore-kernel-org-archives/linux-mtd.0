Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PW8p1-0006lY-ND
	for linux-mtd@lists.infradead.org; Fri, 24 Dec 2010 14:40:45 +0000
Received: by wwb17 with SMTP id 17so7937368wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Dec 2010 06:40:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201012241602.36582.manningc2@actrix.gen.nz>
References: <2A3DCF3DA181AD40BDE86A3150B27B6B03560990E3@dbde02.ent.ti.com>
	<AANLkTimJFsjLT15FA+TqDKzjvPXgxUAvovWpWKP3NCK4@mail.gmail.com>
	<201012241602.36582.manningc2@actrix.gen.nz>
Date: Fri, 24 Dec 2010 22:40:40 +0800
Message-ID: <AANLkTiky0G_H9vGDRNj-y=JTcfCcvRgfXraa0SbAZM4t@mail.gmail.com>
Subject: Re: Issue : jffs2 and ecc layout
From: Ming Lei <tom.leiming@gmail.com>
To: Charles Manning <manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Ghorai, Sukumar" <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

2010/12/24 Charles Manning <manningc2@actrix.gen.nz>:

> THis might be due to the way the omap2.c driver is now screwed up so that it
> does not read when not u32 aligned.
>
> Try this:
> http://www.spinics.net/linux/lists/linux-omap/msg42422.html
>
> Please report back if that fixes the problem for you.

The patch is still a good catch, with it, the following error
message does disappear:

[  299.433197] uncorrectable error :
[  299.436737] uncorrectable error :
[  299.440338] mtd->read(0x530 bytes from 0xf9202d0) returned ECC error
[  299.447875] uncorrectable error :
[  299.451263] uncorrectable error :
[  299.454833] mtd->read(0x44 bytes from 0xf927efc) returned ECC error
[  299.461822] uncorrectable error :
[  299.465240] uncorrectable error :
[  299.468780] uncorrectable error :
[  299.472534] mtd->read(0x5a4 bytes from 0xf940d84) returned ECC error

If not applying this patch, even Jason's patch is reverted, the error message
above will be printed out very frequently during 'mount'.

thanks,
-- 
Lei Ming
