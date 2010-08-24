Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnpIM-0002mG-Nh
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 08:55:51 +0000
Received: by fxm12 with SMTP id 12so4427867fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 01:55:49 -0700 (PDT)
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTik+T6HA+umRvxj5oPmGwf5=tQvk-sNzSTqaq8VB@mail.gmail.com>
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
	<1282574489.24044.74.camel@localhost>
	<AANLkTik+T6HA+umRvxj5oPmGwf5=tQvk-sNzSTqaq8VB@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Aug 2010 11:53:55 +0300
Message-ID: <1282640035.24044.149.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-08-24 at 10:32 +0200, Arno Steffen wrote:
> Please let me know, whether I used it right. I enabled in config
> build test modules, "make modules" and copied this modules to my
> embedded device. There I just typed insmod mtd_readtest.ko
> As far as I could see it just accesses /dev/mtd0. This is read only
> (Xloader and HW-ECC). Can this cause this problems? How to check other
> parts of Flash. Couldn't found some docu to the test modules.
> 
> What does this mean:
> 
> mtd_readtest: finished with errors
> mtd_readtest: error -74 occurred
> =================================================
> insmod: cannot insert 'mtd_readtest.ko': Bad message

Please, check modinfo mtd_readtest and notice there is a 'dev' parameter
which you can use to specify the mtd device to test. Use it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
