Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKMNI-0000Fb-IY
 for linux-mtd@lists.infradead.org; Wed, 29 Jul 2015 08:06:05 +0000
Subject: Re: [PATCH 5/6] mtd: nand: gpmi: correct bitflip for erased NAND page
To: linux-mtd@lists.infradead.org, Han Xu <b45815@freescale.com>
References: <mailman.4028.1438106338.1758.linux-mtd@lists.infradead.org>
 <mailman.4028.1438106338.1758.linux-mtd.{c3fbf4b6-bd46-4f1f-ba46-40c78864ddc3}.0@lists.infradead.org>
 <1438105841-22314-1-git-send-email-b45815@freescale.com>
Cc: shijie8@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-kernel@vger.kernel.org
From: Andrea Scian <rnd4@dave-tech.it>
Message-ID: <55B88952.1060709@dave-tech.it>
Date: Wed, 29 Jul 2015 10:05:38 +0200
MIME-Version: 1.0
In-Reply-To: <1438105841-22314-1-git-send-email-b45815@freescale.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Han Xu,


Il 28/07/2015 19:50, Han Xu ha scritto:
> i.MX6QP and i.MX7D BCH module integrated a new feature to detect the
> bitflip number for erased NAND page. So for these two platform, set the
> erase threshold to gf/2 and if bitflip detected, GPMI driver will
> correct the data to all 0xFF.


That's an iteresting feature of iMX6QP
We were discussing about erased NAND page bitflip in MTD ML a few days ago.

Is gf/2 a right value to choose? Why?
IIUC, in a previuos MTD-level patch [1] Brian used ECC strength as 
threshold.

Could you please also share with which NAND device you tested this patch?

Kind regards and TIA,

-- 

Andrea SCIAN

DAVE Embedded Systems

[1] http://article.gmane.org/gmane.linux.drivers.mtd/52216
