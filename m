Received: from mail-oi0-f67.google.com ([209.85.218.67])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1br8LN-0002Hw-LX
 for linux-mtd@lists.infradead.org; Mon, 03 Oct 2016 18:52:06 +0000
Received: by mail-oi0-f67.google.com with SMTP id h186so7980024oia.3
 for <linux-mtd@lists.infradead.org>; Mon, 03 Oct 2016 11:51:45 -0700 (PDT)
Date: Mon, 3 Oct 2016 13:51:43 -0500
From: Rob Herring <robh@kernel.org>
To: "Albert ARIBAUD (3ADEV)" <albert.aribaud@3adev.fr>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 2/2] fsl-quadspi: introduce per-bus spi-bus-width property
Message-ID: <20161003185143.GA27634@rob-hp-laptop>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
 <20160927055957.427-2-albert.aribaud@3adev.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160927055957.427-2-albert.aribaud@3adev.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 27, 2016 at 07:59:57AM +0200, Albert ARIBAUD (3ADEV) wrote:
> Introduce spi-bus-width property for bus subnodes, to
> specify per-bus capability to use NORMAL, FAST, DUAL,
> and/or QUAD reads.
> 
> Signed-off-by: Albert ARIBAUD (3ADEV) <albert.aribaud@3adev.fr>
> ---
>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Make this a common property.

Rob
