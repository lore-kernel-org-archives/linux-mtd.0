Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PKSls-000661-Da
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2010 09:33:13 +0000
Received: by fxm6 with SMTP id 6so1487864fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Nov 2010 01:33:10 -0800 (PST)
Subject: Re: block2mtd and ubi
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?Llu=EDs?= Batlle i Rossell <viriketo@gmail.com>
In-Reply-To: <20101122090940.GK9645@vicerveza.homeunix.net>
References: <20101120175856.GD9645@vicerveza.homeunix.net>
	<20101121000145.GF9645@vicerveza.homeunix.net>
	<1290413562.2289.14.camel@localhost>
	<20101122090940.GK9645@vicerveza.homeunix.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Nov 2010 11:32:45 +0200
Message-ID: <1290418365.2289.25.camel@localhost>
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

On Mon, 2010-11-22 at 10:09 +0100, Lluís Batlle i Rossell wrote:
> On Mon, Nov 22, 2010 at 10:12:42AM +0200, Artem Bityutskiy wrote:
> > On Sun, 2010-11-21 at 01:01 +0100, Lluís Batlle i Rossell wrote:
> > > On Sat, Nov 20, 2010 at 06:58:56PM +0100, Lluís Batlle i Rossell wrote:
> > > It's a pity that the same 'ubinize' cannot do that job automatically, and give
> > > an image filling all the memory blocks. That would easy down a lot the job for
> > > block2mtd.
> > 
> > Use ubiformat - it should get it right:
> > 
> > http://www.linux-mtd.infradead.org/faq/ubi.html#L_flash_img
> 
> I know, but I cannot do that on a block2mtd, if the block2mtd device I use is
> the rootfs of the system. All I have is a kernel, qemu, and a rootfs in a
> 'ubinize' ubi image.

Why you can dd buy cannot ubiformat? What is the fundamental difference?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
