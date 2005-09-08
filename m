Received: from [84.204.75.148] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDMuh-0004vU-S6
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2005 09:58:07 -0400
Message-ID: <43203E13.3080204@yandex.ru>
Date: Thu, 08 Sep 2005 17:35:15 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <42E5ECE5.4010901@inf.u-szeged.hu>	
	<20050726093215.GD15903@wohnheim.fh-wedel.de>	
	<20050726100330.GF15903@wohnheim.fh-wedel.de>	
	<42EDF04C.1010108@inf.u-szeged.hu>	
	<20050801095645.GA32464@wohnheim.fh-wedel.de>	
	<42EDF470.4060208@inf.u-szeged.hu>	
	<20050801104343.GB32464@wohnheim.fh-wedel.de>	
	<42EE2B78.70500@inf.u-szeged.hu>	
	<20050801141841.GD32464@wohnheim.fh-wedel.de>	
	<42FB68AE.6070805@inf.u-szeged.hu>	
	<20050815094816.GA27229@wohnheim.fh-wedel.de>	<43007773.2070602@yandex.ru>	
	<43008129.2060303@inf.u-szeged.hu>	<43008BFB.502@yandex.ru>	
	<4300970E.2090803@inf.u-szeged.hu>
	<43009AE1.6010907@yandex.ru>	 <4301A259.3090304@yandex.ru>
	<1126186364.28995.10.camel@hades.cambridge.redhat.com>
In-Reply-To: <1126186364.28995.10.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: zhao_fusheng@hotmail.com, linux-mtd@lists.infradead.org
Subject: Re: JFFS2 eraseblock header
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> Should it? I wonder if it should silently upgrade, instead? Or at least
> have a mount option to make it upgrade? We want to leave the old format
> behind...
That would be spiffy to leave it behind and save a lot efforts.
But in this case new JFFS2 binaries will reject mounting old JFFS2 images.
If this is accaptable - fine. Personally I don't care, but people may.
:-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
