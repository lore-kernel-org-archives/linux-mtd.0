Subject: Re: [PATCH] [MTD] [RESEND] MAPS: add support for Nvidia MCP55 to
	ck804xrom
From: David Woodhouse <dwmw2@infradead.org>
To: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
In-Reply-To: <478E1880.2040609@gmx.net>
References: <478E1880.2040609@gmx.net>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 18:12:23 +0100
Message-Id: <1208884343.9212.633.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-01-16 at 15:45 +0100, Carl-Daniel Hailfinger wrote:
> [PATCH] [MTD] MAPS: add support for Nvidia MCP55 to ck804xrom
> 
> This patch extends the existing MAPS driver for the Nvidia CK804 chipset
> (ck804xrom.c) to also work on the Nvidia MCP55 chipset. As both chipsets
> are rather similar, suporting them both with the same driver is easy.
> 
> The patch is not ready for inclusion yet, it needs some codingstyle care
> and probably better comments. The indenting is wrong at some points to
> keep the diff minimal for a first review. I will post a better version
> once I get some comments.

I fixed that and applied it anyway.

> +	{ PCI_VENDOR_ID_NVIDIA, 0x0363,
> +        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
> +	{ PCI_VENDOR_ID_NVIDIA, 0x0364,
> +        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
> +	{ PCI_VENDOR_ID_NVIDIA, 0x0365,
> +        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
> +	{ PCI_VENDOR_ID_NVIDIA, 0x0366,
> +        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */
> +	{ PCI_VENDOR_ID_NVIDIA, 0x03607,
> +        PCI_ANY_ID, PCI_ANY_ID, 2 }, /* nvidia mcp55 */


I fixed that too; I assume the last ID should have been 0x367?

-- 
dwmw2
