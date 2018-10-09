Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9mgD-0001uC-Ua
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2018 07:43:47 +0000
Received: by mail-lf1-x141.google.com with SMTP id m18-v6so450495lfl.11
 for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2018 00:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
 <20181008201027.17952-15-boris.brezillon@bootlin.com>
In-Reply-To: <20181008201027.17952-15-boris.brezillon@bootlin.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 9 Oct 2018 09:43:16 +0200
Message-ID: <CAPybu_0LYnWzgUX=HvY3HZUw8pLWTWR5ppG3TVG7S9dt_XitRw@mail.gmail.com>
Subject: Re: [PATCH 14/14] dt-binding: mtd: physmap: Document the addr-gpios
 property
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI Boris

Usually they want the bindings to be sent before the changes. You
might want to swap the order of 13 and 14. And I think the version
reviewed by Rob is too different to this version, maybe we want to
ping him to be 100% sure that his review is still valid.

FWIW: To the whose serie, after you send the fixed version, you can
add to all the patches my:
Reviewed-by:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

and to the last one:
Tested-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Thanks a lot for the serie!
On Mon, Oct 8, 2018 at 10:10 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>
> Add documentation for the addr-gpios. This extension to the physmap
> binding allow creating flash devices that are paged using GPIOs.
>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> index 232fa12e90ef..7df0dcaccb7d 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> @@ -29,6 +29,8 @@ file systems on embedded devices.
>   - use-advanced-sector-protection: boolean to enable support for the
>     advanced sector protection (Spansion: PPB - Persistent Protection
>     Bits) locking.
> + - addr-gpios : (optional) List of GPIO descriptors that will be used to
> +   address the MSBs address lines. The order goes from LSB to MSB.
>
>  For JEDEC compatible devices, the following additional properties
>  are defined:
> --
> 2.14.1
>


-- 
Ricardo Ribalda
