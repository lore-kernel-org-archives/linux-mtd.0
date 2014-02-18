Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFqsA-00051q-83
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 20:02:30 +0000
Received: by mail-wg0-f41.google.com with SMTP id l18so3410428wgh.2
 for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2014 12:02:08 -0800 (PST)
Message-ID: <5303BC3E.2090701@gmail.com>
Date: Tue, 18 Feb 2014 21:02:06 +0100
From: Boris BREZILLON <b.brezillon.dev@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/2] mtd: nand: Add a devicetree binding for ECC
 strength and ECC step size
References: <1392749474-12936-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392749474-12936-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1392749474-12936-3-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Grant Likely <grant.likely@secretlab.ca>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 18/02/2014 19:51, Ezequiel Garcia a écrit :
> Some flashes can only be properly accessed when the ECC mode is
> specified, so a way to describe such mode is required.
>
> Together, the ECC strength and step size define the correction capability,
> so that we say we will correct "{strength} bit errors per {size} bytes".
>
> The interpretation of these parameters is implementation-defined, but they
> often have ramifications on the formation, interpretation, and placement of
> correction metadata on the flash. Not all implementations must support all
> possible combinations. Implementations are encouraged to further define the
> value(s) they support.
>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Acked-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
> ---
> Brian,
>
> Feel free to rephrase or improve the explanation below as you whish.
>
>   Documentation/devicetree/bindings/mtd/nand.txt | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
> index 03855c8..b53f92e 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -5,3 +5,17 @@
>     "soft_bch".
>   - nand-bus-width : 8 or 16 bus width if not present 8
>   - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
> +
> +- nand-ecc-strength: integer representing the number of bits to correct
> +		     per ECC step.
> +
> +- nand-ecc-step-size: integer representing the number of data bytes
> +		      that are covered by a single ECC step.
> +
> +The ECC strength and ECC step size properties define the correction capability
> +of a controller. Together, they say a controller can correct "{strength} bit
> +errors per {size} bytes".
> +
> +The interpretation of these parameters is implementation-defined, so not all
> +implementations must support all possible combinations. However, implementations
> +are encouraged to further specify the value(s) they support.
