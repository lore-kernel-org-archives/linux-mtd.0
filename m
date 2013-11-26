Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlI1t-0002WF-8W
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 12:46:13 +0000
Date: Tue, 26 Nov 2013 09:45:45 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI
 param or nand_id[]
Message-ID: <20131126124544.GC2344@localhost>
References: <1385382728-7913-1-git-send-email-pekon@ti.com>
 <52944E45.6070803@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA4ECA1@DBDE04.ent.ti.com>
 <5294683B.6010704@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5294683B.6010704@freescale.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "Balbi, Felipe" <balbi@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 26, 2013 at 05:22:03PM +0800, Huang Shijie wrote:
> (I am not sure whether we should remove the NAND_BUSWIDTH_AUTO, let 
> Brian judge it)
> 

Have you followed the past discussion around 16-bit ONFI detection
(currently broken, IIRC)?

We concluded that the auto-discovery (aka NAND_BUSWIDTH_AUTO) should be the default
behavior, since there's no other way to handle ONFI devices. Hence,
there's little point in keeping the macro.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
