Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18EFDi-0003rk-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Nov 2002 20:43:43 +0000
Date: Tue, 19 Nov 2002 22:13:59 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Richard Brunelle <rbrunelle@envitech.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: BBRAM
Message-ID: <20021119211359.GA3117@wohnheim.fh-wedel.de>
References: <3DDA7F28.8030309@envitech.com> <20021119185337.GB4756@wohnheim.fh-wedel.de> <3DDA93A3.1070001@envitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3DDA93A3.1070001@envitech.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 19 November 2002 14:40:19 -0500, Richard Brunelle wrote:
> 
> -How the parameters to SLRAM are passed?

This depends on your boot loader. For lilo, you can put this into
/etc/lilo.conf:
	append="slram=bbram,exe0000,+0x8000"

> -Is there any provision for pageable memory?

No, none. The slram driver needs absolute control over the memory
area, it uses. If the kernel mm code also uses it, e.g. hands it out
on kmalloc() calls, you're screwed.

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
