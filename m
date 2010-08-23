Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnYEn-0006uS-PM
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 14:43:03 +0000
Received: by fxm12 with SMTP id 12so3674619fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 07:43:00 -0700 (PDT)
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTinqAT=aCYFBi8Nri72L898U0k6dTk3z90OJOpRc@mail.gmail.com>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
	<1280244340.3021.38.camel@localhost.localdomain>
	<AANLkTi=7-Ur35OzqF7iJtiPzfc-Jp-ANGwa3g_Y=+ae8@mail.gmail.com>
	<1280471755.2838.29.camel@localhost.localdomain>
	<AANLkTikZb=R=8BObvTN6uGaZGAmvvUZd4oYKvkCJih7H@mail.gmail.com>
	<AANLkTikkRNqnEX0PkHigv=zT+Z36J52DEtoVeMGbBExf@mail.gmail.com>
	<AANLkTim6U4uO_2yf-VyoL+4j9-yDkouTQdP_aszpEXwW@mail.gmail.com>
	<1282566891.24044.32.camel@localhost>
	<AANLkTinqAT=aCYFBi8Nri72L898U0k6dTk3z90OJOpRc@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Aug 2010 17:41:29 +0300
Message-ID: <1282574489.24044.74.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, twebb <taliaferro62@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-23 at 16:13 +0200, Arno Steffen wrote:
> My results are: (other will follow next day)

... snip ...

> mtd_readtest: MTD device: 0
> mtd_readtest: MTD device size 262144, eraseblock size 131072, page
> size 2048, count of eraseblocks 2, pages per eraseblock 64, OOB size
> 64
> mtd_readtest: scanning for bad eraseblocks
> mtd_readtest: scanned 2 eraseblocks, 0 are bad
> mtd_readtest: testing page read
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> mtd_readtest: error: read failed at 0x0
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> mtd_readtest: error: read failed at 0x800
> uncorrectable error :

They do not look very too well :-)

No wonder UBI hates your flash and refuses it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
