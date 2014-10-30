Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjgNb-0006Uv-Nx
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 03:26:32 +0000
From: Marek Vasut <marex@denx.de>
To: Chunhe Lan <Chunhe.Lan@freescale.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Move n25q032 entry to Micron devices list
Date: Thu, 30 Oct 2014 04:26:05 +0100
References: <1414639572-28756-1-git-send-email-Chunhe.Lan@freescale.com>
In-Reply-To: <1414639572-28756-1-git-send-email-Chunhe.Lan@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201410300426.05839.marex@denx.de>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie8@gmail.com>, zajec5@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, October 30, 2014 at 04:26:12 AM, Chunhe Lan wrote:
> Because n25q032 is the Micron SPI chip, move it to Micron
> devices list group. In order that know which Micron SPI
> chips have been support at a glance.
> 
> Signed-off-by: Chunhe Lan <Chunhe.Lan@freescale.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Huang Shijie <shijie8@gmail.com>

Rafal, you were right :)

Acked-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
