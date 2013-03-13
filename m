Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFjKs-0003bp-L3
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 10:55:07 +0000
Message-ID: <1363172157.11441.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V4 2/3] mtd: add 4 Toshiba nand chips for the full-id case
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Huang Shijie <b32955@freescale.com>
Date: Wed, 13 Mar 2013 12:55:57 +0200
In-Reply-To: <1362653364-29993-3-git-send-email-b32955@freescale.com>
References: <1362653364-29993-1-git-send-email-b32955@freescale.com>
 <1362653364-29993-3-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-03-07 at 18:49 +0800, Huang Shijie wrote:
> +	/* TOSHIBA */
> +	{"TC58NVG2S0F 4G 3.3V 8-bit",
> +		{ .id = {0x98, 0xdc, 0x90, 0x26, 0x76, 0x15, 0x01, 0x08}},
> +			SZ_4K, SZ_512, SZ_256K, 0, 8, 224},
> +	{"TC58NVG3S0F 8G 3.3V 8-bit",
> +		{ .id = {0x98, 0xd3, 0x90, 0x26, 0x76, 0x15, 0x02, 0x08}},
> +			SZ_4K, SZ_1K, SZ_256K, 0, 8, 232},
> +	{"TC58NVG5D2 32G 3.3V 8-bit",
> +		{ .id = {0x98, 0xd7, 0x94, 0x32, 0x76, 0x56, 0x09, 0x00}},
> +			SZ_8K, SZ_4K, SZ_1M, 0, 8, 640},
> +	{"TC58NVG6D2 64G 3.3V 8-bit",
> +		{ .id = {0x98, 0xde, 0x94, 0x82, 0x76, 0x56, 0x04, 0x20}},
> +			SZ_8K, SZ_8K, SZ_2M, 0, 8, 640},

We need a useful comment above this block explaining that it is
important to have full ID records first.

-- 
Best Regards,
Artem Bityutskiy
