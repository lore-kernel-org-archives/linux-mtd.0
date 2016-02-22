Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXge8-0004kj-6l
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2016 02:54:49 +0000
Date: Sun, 21 Feb 2016 20:54:27 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] of: mtd: add helper reading "nand-ecc-algo" from DT
Message-ID: <20160222025427.GK15973@rob-hp-laptop>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 12, 2016 at 07:11:23PM +0100, Rafał Miłecki wrote:
> This allows specifying algorithm used for NAND ECC. There are two
> available values: "bch" and "hamming". It's important as having just
> ECC parameters (step, strength) isn't enough to determine algorithm,
> e.g. you can't distinct BCH-1 and Hamming.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt |  3 +++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/of/of_mtd.c                            | 33 ++++++++++++++++++++++++++
>  include/linux/mtd/nand.h                       |  5 ++++
>  include/linux/of_mtd.h                         |  6 +++++
>  4 files changed, 47 insertions(+)
