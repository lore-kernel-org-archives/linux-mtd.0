Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0xAj-0002Xa-EJ
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 13:58:14 +0000
Subject: Re: pwrite() to nand in raw mode fails with EINVAL
From: Maxime Bizon <mbizon@freebox.fr>
To: dedekind1@gmail.com
In-Reply-To: <1285764747.2437.116.camel@localhost>
References: <1285699650.32420.70.camel@sakura.staff.proxad.net>
	<1285764747.2437.116.camel@localhost>
Content-Type: text/plain; charset="ANSI_X3.4-1968"
Date: Wed, 29 Sep 2010 15:58:04 +0200
Message-ID: <1285768684.32420.91.camel@sakura.staff.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
Reply-To: mbizon@freebox.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2010-09-29 at 15:52 +0300, Artem Bityutskiy wrote:

> Maxime, I've cleaned up comments, added your signed-off-by and cc
> stable. Is this OK?

Yep

> It would also be nice to get an ack from Maxim Levitsky.

The patch fixes the problem, but I let Maxim decides if that's the
correct way to fix it.

-- 
Maxime
