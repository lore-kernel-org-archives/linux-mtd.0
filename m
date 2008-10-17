Received: from mail-gx0-f10.google.com ([209.85.217.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqt76-0002Ex-VY
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 17:27:49 +0000
Received: by gxk3 with SMTP id 3so1500926gxk.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Oct 2008 10:27:48 -0700 (PDT)
Message-ID: <6934efce0810171027i2afddf0ct77acc83fcf3dbd80@mail.gmail.com>
Date: Fri, 17 Oct 2008 10:27:47 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Lennert Buytenhek" <buytenh@wantstofly.org>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
In-Reply-To: <20081017010643.GE14569@xi.wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<1223979634.6770.767.camel@macbook.infradead.org>
	<6934efce0810161730l2aa66f30v83c6ed644e0d6707@mail.gmail.com>
	<20081017010643.GE14569@xi.wantstofly.org>
Cc: linux-mtd@lists.infradead.org, nico@cam.org,
	David Woodhouse <dwmw2@infradead.org>,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> IMHO it's fine if physmap gets additional options, but those extra
> options should be configured via platform data, and not via the legacy
> CONFIG_MTD_PHYSMAP_xxx kernel config options.

How?  Maybe I don't understand what you mean by platform data...
