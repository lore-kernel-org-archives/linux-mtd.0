Received: from smtp.scorch.co.nz ([27.110.127.199] helo=scorch.co.nz)
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PUR4q-00035v-Ua
	for linux-mtd@lists.infradead.org; Sun, 19 Dec 2010 21:46:01 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v6 0/7] nand prefetch-irq support and ecc layout chanage
Date: Mon, 20 Dec 2010 10:45:53 +1300
References: <1290785677-16005-1-git-send-email-s-ghorai@ti.com>
In-Reply-To: <1290785677-16005-1-git-send-email-s-ghorai@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201012201045.53688.manningc2@actrix.gen.nz>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sukumar Ghorai <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 27 November 2010 04:34:30 Sukumar Ghorai wrote:
> The following set of patches applies on linux-2.6.
>
> The main motivations behind this patch series are -
>         1. support NAND I/O in irq mode.
>         2. support of different ECC schema.
>         3. also to make ecc layout as like in romcode ecc layout

Why change the ECC layout?

Be very careful when you change ECC layouts. This can break production 
systems.

For example if people are running something earlier and then want to deliver a 
new kernel with 2.6.37 then their existing NAND file systems will no longer 
be readable.

Changes to ECC should only be done for very good reasons and should be 
controlled with a Kconfig with the default being the existing ECC layout.

-- Charles
