Date: Mon, 5 Feb 2018 00:09:30 -0600
From: Rob Herring <robh@kernel.org>
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 mark.rutland@arm.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com
Subject: Re: [PATCH v2 2/2] dt-bindings: spi: updated usage example for
 spi-rx/tx-bus-width properties
Message-ID: <20180205060930.ifyfya5fblr254ww@rob-hp-laptop>
References: <1517549484-6024-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1517549484-6024-3-git-send-email-yogeshnarayan.gaur@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1517549484-6024-3-git-send-email-yogeshnarayan.gaur@nxp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 02, 2018 at 11:01:24AM +0530, Yogesh Gaur wrote:
> Updated usage example by adding properties spi-rx-bus-width
> and spi-tx-bus-width for slave node binding.
> 
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> ---
> Changes for v2:
> - None
> 
>  Documentation/devicetree/bindings/spi/spi-bus.txt | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
