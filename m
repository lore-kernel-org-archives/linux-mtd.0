Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTbsg-00085b-Gr
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 15:38:19 +0000
Received: by fxm14 with SMTP id 14so3674331fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 08:38:15 -0700 (PDT)
Subject: Re: [PATCH 1/1] MTD mtdchar: add missing initializer on raw write
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Wippich <pewi@gw-instruments.de>
In-Reply-To: <alpine.LSU.2.00.1106061541210.26001@redbean.intranet.gw-instruments.de>
References: <alpine.LSU.2.00.1106061541210.26001@redbean.intranet.gw-instruments.de>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 18:33:59 +0300
Message-ID: <1307374439.3112.81.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 15:50 +0200, Peter Wippich wrote:
> On writes in MODE_RAW the mtd_oob_ops struct is not sufficiently 
> initialized which may cause nandwrite to fail. With this patch
> it is possible to write raw nand/oob data without additional ECC
> (either for testing or when some sectors need different oob layout
> e.g. bootloader) like
> nandwrite  -n -r -o  /dev/mtd0 <myfile>
> 
> Signed-off-by: Peter Wippich <pewi@gw-instruments.de>

Pushed your patch to the l2-mtd-2.6.git tree, thanks. It did not apply,
but I amended it. I guess it is against some old kernel tree. Also, I've
added "Cc: stable@kernel.org" to make sure it reaches the -stable tree.

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/87d5d1460c4e13636406a613f5740ef5e5cdbbfa

A "Tested-by" would be great!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
