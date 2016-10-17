Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwErA-000108-Rw
 for linux-mtd@lists.infradead.org; Mon, 17 Oct 2016 20:50:03 +0000
Received: by mail-pf0-x231.google.com with SMTP id s8so83246949pfj.2
 for <linux-mtd@lists.infradead.org>; Mon, 17 Oct 2016 13:49:39 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] arm64: dts: Updated NAND DT properties for NS2 SVK
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <1469051631-7896-1-git-send-email-ray.jui@broadcom.com>
 <1469051631-7896-3-git-send-email-ray.jui@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Prafulla Kota <prafulla.kota@broadcom.com>
From: Ray Jui <ray.jui@broadcom.com>
Message-ID: <8832e18c-cd77-9fe1-8bd8-a2d65390666a@broadcom.com>
Date: Mon, 17 Oct 2016 13:49:27 -0700
MIME-Version: 1.0
In-Reply-To: <1469051631-7896-3-git-send-email-ray.jui@broadcom.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Florian,

Would you be able to help to queue the following patch for v4.10? Sorry 
I did not include you in the "To" field of the original email.

Thanks,

Ray

On 7/20/2016 2:53 PM, Ray Jui wrote:
> This patch adds NAND DT properties for NS2 SVK to configure the bus
> width width and OOB sector size
>
> Signed-off-by: Prafulla Kota <prafulla.kota@broadcom.com>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> ---
>  arch/arm64/boot/dts/broadcom/ns2-svk.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> index 54ca40c..5ef0407 100644
> --- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> +++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> @@ -128,6 +128,8 @@
>  		nand-ecc-mode = "hw";
>  		nand-ecc-strength = <8>;
>  		nand-ecc-step-size = <512>;
> +		nand-bus-width = <16>;
> +		brcm,nand-oob-sector-size = <16>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  	};
>
