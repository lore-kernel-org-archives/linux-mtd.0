Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDRMt-0000HY-Ly
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2005 14:43:35 -0400
Date: Thu, 8 Sep 2005 20:43:26 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Message-ID: <20050908184326.GE20668@wohnheim.fh-wedel.de>
References: <42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru> <43008129.2060303@inf.u-szeged.hu>
	<43008BFB.502@yandex.ru> <4300970E.2090803@inf.u-szeged.hu>
	<43009AE1.6010907@yandex.ru> <4301A259.3090304@yandex.ru>
	<1126186364.28995.10.camel@hades.cambridge.redhat.com>
	<43203E13.3080204@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43203E13.3080204@yandex.ru>
Cc: zhao_fusheng@hotmail.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 eraseblock header
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 September 2005 17:35:15 +0400, Artem B. Bityuckiy wrote:
> David Woodhouse wrote:
>
> >Should it? I wonder if it should silently upgrade, instead? Or at least
> >have a mount option to make it upgrade? We want to leave the old format
> >behind...
>
> That would be spiffy to leave it behind and save a lot efforts.
> But in this case new JFFS2 binaries will reject mounting old JFFS2 images.
> If this is accaptable - fine. Personally I don't care, but people may.
> :-)

Current strategy is to push the effort to the user.  Not perfect, but
it is necessary to inform the users about the problem anyway.

What we could additionally do is detect nodes that span several erase
blocks.  Whenever such a thing comes up, refuse the mount and error
out.

But then again, I just couldn't care less.  So someone else please
provide the code.

Jörn

-- 
It does not matter how slowly you go, so long as you do not stop.
-- Confucius
