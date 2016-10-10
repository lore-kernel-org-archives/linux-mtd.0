Date: Mon, 10 Oct 2016 08:16:14 -0500
From: Rob Herring <robh@kernel.org>
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: linux@armlinux.org.uk, linux@simtec.co.uk, mark.rutland@arm.com,
 devicetree@vger.kernel.org, kgene@kernel.org, krzk@kernel.org,
 javier@osg.samsung.com, boris.brezillon@free-electrons.com,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: mtd: add DT binding for s3c2410 flash
 controller
Message-ID: <20161010131614.GA7855@rob-hp-laptop>
References: <1475711217-974-1-git-send-email-sergio.prado@e-labworks.com>
 <1475711217-974-3-git-send-email-sergio.prado@e-labworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475711217-974-3-git-send-email-sergio.prado@e-labworks.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 05, 2016 at 08:46:56PM -0300, Sergio Prado wrote:
> Adds the device tree bindings description for Samsung S3C2410 and
> compatible NAND flash controller.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  .../devicetree/bindings/mtd/samsung-s3c2410.txt    | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt

Acked-by: Rob Herring <robh@kernel.org>
