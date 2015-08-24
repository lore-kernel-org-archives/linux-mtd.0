Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTtVQ-0004L7-8F
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 15:17:52 +0000
Received: by qkda128 with SMTP id a128so21525236qkd.3
 for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2015 08:17:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1438693881-10432-1-git-send-email-geert+renesas@glider.be>
References: <1438693881-10432-1-git-send-email-geert+renesas@glider.be>
From: Rob Herring <robherring2@gmail.com>
Date: Mon, 24 Aug 2015 10:17:11 -0500
Message-ID: <CAL_JsqKZaGVw_CWPhvH_YWaAhOcZArWxJ-yh7fuAx-zxavh+aw@mail.gmail.com>
Subject: Re: [PATCH v2] of: Add vendor prefix for JEDEC Solid State Technology
 Association
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 4, 2015 at 8:11 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add the "jedec" vendor prefix for the "JEDEC Solid State Technology
> Association" (formerly known as the "Joint Electron Device Engineering
> Council"), which is already in use in several bindings.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Brian Norris <computersforpeace@gmail.com>

Applied. Thanks.

Rob

> ---
> v2:
>   - Add Acked-by.
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index f727469b0893b2c3..1d88c84545b4dfd9 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -113,6 +113,7 @@ intel       Intel Corporation
>  intercontrol   Inter Control Group
>  isee   ISEE 2007 S.L.
>  isil   Intersil
> +jedec  JEDEC Solid State Technology Association
>  karo   Ka-Ro electronics GmbH
>  keymile        Keymile GmbH
>  kinetic Kinetic Technologies
> --
> 1.9.1
>
