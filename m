Subject: Re: [PATCH 4/4] MTD: include ar7part in the list of partitions parsers
From: David Woodhouse <dwmw2@infradead.org>
To: Florian Fainelli <florian@openwrt.org>
In-Reply-To: <201001032117.37459.florian@openwrt.org>
References: <201001032117.37459.florian@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 03 Jan 2010 20:56:17 +0000
Message-ID: <1262552177.3181.5891.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	ralf@linux-mips.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-01-03 at 21:17 +0100, Florian Fainelli wrote:
> This patch modifies the physmap-flash driver to include
> the ar7part partition parser in the list of parsers to
> use when a physmap-flash driver is registered. This is
> required for AR7 to create partitions correctly.

Hrm, perhaps we'd do better to allow the probe types to be specified in
the platform physmap_flash_data?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
