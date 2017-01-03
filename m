Date: Tue, 3 Jan 2017 10:04:39 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alison Wang <b18965@freescale.com>
Cc: <marek.vasut@gmail.com>, <cyrille.pitchen@atmel.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <alison.wang@nxp.com>
Subject: Re: [PATCH v2 1/2] mtd: ifc: Update dependency of IFC for LS1021A
Message-ID: <20170103100439.6e7360c6@bbrezillon>
In-Reply-To: <1483411266-45875-1-git-send-email-b18965@freescale.com>
References: <1483411266-45875-1-git-send-email-b18965@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alison,

The subject prefix should be "memory: " and not "mtd: ifc: ".

Looks good otherwise.

No need to resend, I can fix that when applying.

Regards,

Boris

On Tue, 3 Jan 2017 10:41:05 +0800
Alison Wang <b18965@freescale.com> wrote:

> As Freescale/NXP IFC controller is available on LS1021A, the dependency
> for LS1021A is added.
> 
> Signed-off-by: Alison Wang <alison.wang@nxp.com>
> ---
> Changes in v2:
> - New patch
> 
>  drivers/memory/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index ec80e35..fff8345 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -115,7 +115,7 @@ config FSL_CORENET_CF
>  
>  config FSL_IFC
>  	bool
> -	depends on FSL_SOC || ARCH_LAYERSCAPE
> +	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A
>  
>  config JZ4780_NEMC
>  	bool "Ingenic JZ4780 SoC NEMC driver"
