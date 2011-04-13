Received: from usausmgw02.spansion.com ([12.110.209.162])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9yw7-0001rg-43
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 12:12:43 +0000
Subject: Re: Re: Does NOR chip drivers support PPB protection
From: Gernot Hoyler <Gernot.Hoyler@spansion.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <BANLkTinjNP=gxbnLEdEVExB7-2u22Nh53A@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 13 Apr 2011 13:47:08 +0200
Message-ID: <1302695228.1972.3.camel@MUC-CSE-01.spansion.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: vk.raghavendra@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> So if we are willing to use the freeze bit that we need some callback
> into the chip specific driver (mapping driver) that can issue a reset.
> Comments? 

Normally, the purpose of the PPB lock bit is to prevent users from
changing the PPB bits/settings after initial setup. In this case, you
program your image to flash and lock certain sectors (e.g. on a tester
or factory in-system programming). Afterwards you set the PPB lock bit
pretty early in the boot phase (e.g. boot loader or boot code) to
protect both the sectors and their PPB bits.
