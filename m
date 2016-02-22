Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXkx4-0005Cj-2d
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2016 07:30:39 +0000
Date: Mon, 22 Feb 2016 08:30:07 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Guilherme de Oliveira Costa <guilherme.oliveira@autotrac.com.br>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: NAND Bad Block Marking Policy
In-Reply-To: <7F9DB42F7DDA544EA3EB31D694929A30EB0506@PERU.autotrac.corp>
Message-ID: <alpine.DEB.2.02.1602220828340.21201@lnxricardw1.se.axis.com>
References: <7F9DB42F7DDA544EA3EB31D694929A30EB0506@PERU.autotrac.corp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 19 Feb 2016, Guilherme de Oliveira Costa wrote:

> This started due to some weird problems we had that out of
> nowhere our rootfs stopped booting, among other things.
> We are using a cramfs image as our rootfs, but I've found
> some ancient threads stating that cramfs is not recommended
> for NAND memories.
> 
> Does this still hold true?

The problem with cramfs is that it can only work if there is a continguous 
block of flash memory for it to reside in. This means that it cannot 
reside in a partition if there are bad blocks present, which is why it is 
not recommended for NAND flash. Apart from that (severe) constraint, it 
wouldn't be a problem.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
