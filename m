Received: from mail-ot0-f196.google.com ([74.125.82.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eLzLy-0007Ef-4v
 for linux-mtd@lists.infradead.org; Mon, 04 Dec 2017 22:36:47 +0000
Received: by mail-ot0-f196.google.com with SMTP id p3so16214904oti.5
 for <linux-mtd@lists.infradead.org>; Mon, 04 Dec 2017 14:36:25 -0800 (PST)
Date: Mon, 4 Dec 2017 16:36:24 -0600
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: Re: [PATCH] dt-bindings: mtd: fsl-quadspi: Pass the qspi clock names
Message-ID: <20171204223624.gd3iiha3qyr7nwxg@rob-hp-laptop>
References: <1512340584-26894-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512340584-26894-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 03, 2017 at 08:36:24PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> In order to improve the bindings documentation, explicitly pass the name
> of the clocks: "qspi_en" and "qspi", which are mandatory.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
