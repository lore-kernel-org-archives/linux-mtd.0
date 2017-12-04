Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eLqM7-00040e-DE
 for linux-mtd@lists.infradead.org; Mon, 04 Dec 2017 13:00:21 +0000
Subject: Re: [PATCH] dt-bindings: mtd: fsl-quadspi: Pass the qspi clock names
To: Fabio Estevam <festevam@gmail.com>, boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
References: <1512340584-26894-1-git-send-email-festevam@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <e41fd38e-1d41-8bc5-aee6-17473c7a0988@wedev4u.fr>
Date: Mon, 4 Dec 2017 13:59:46 +0100
MIME-Version: 1.0
In-Reply-To: <1512340584-26894-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 03/12/2017 à 23:36, Fabio Estevam a écrit :
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> In order to improve the bindings documentation, explicitly pass the name
> of the clocks: "qspi_en" and "qspi", which are mandatory.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Acked-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>

> ---
>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> index c34aa6f..cc3f579 100644
> --- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> @@ -12,7 +12,7 @@ Required properties:
>    - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
>    - interrupts : Should contain the interrupt for the device
>    - clocks : The clocks needed by the QuadSPI controller
> -  - clock-names : the name of the clocks
> +  - clock-names : Should contain the name of the clocks: "qspi_en" and "qspi".
>  
>  Optional properties:
>    - fsl,qspi-has-second-chip: The controller has two buses, bus A and bus B.
> 
