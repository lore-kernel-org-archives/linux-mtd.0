Received: from yw-out-1718.google.com ([74.125.46.155])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KqtaV-0003zr-HI
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 17:58:11 +0000
Received: by yw-out-1718.google.com with SMTP id 5so328100ywm.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Oct 2008 10:58:10 -0700 (PDT)
Message-ID: <6934efce0810171058g7ea41c72icb9c9e91a697b394@mail.gmail.com>
Date: Fri, 17 Oct 2008 10:58:10 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Alexey Korolev" <akorolev@infradead.org>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
In-Reply-To: <alpine.LFD.1.10.0810171828560.24182@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<1223979634.6770.767.camel@macbook.infradead.org>
	<6934efce0810161730l2aa66f30v83c6ed644e0d6707@mail.gmail.com>
	<20081017010643.GE14569@xi.wantstofly.org>
	<6934efce0810171027i2afddf0ct77acc83fcf3dbd80@mail.gmail.com>
	<alpine.LFD.1.10.0810171828560.24182@casper.infradead.org>
Cc: nico@cam.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> It is possible to setup flash physmap parameters in platform driver. In
> the case of MainstoneII you just need to specify physmap flash data in mainstone.c
> like this.

Right.  Which means you have to tweak the kernel sources when you
remap things.  I much prefer to let these kinds of options and
parameters not be hard coded into the kernel sources.  How about a
.config options or commandline input instead?
