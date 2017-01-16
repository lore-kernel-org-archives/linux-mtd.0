Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cT7ip-0002jP-IW
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 13:53:21 +0000
Date: Mon, 16 Jan 2017 14:52:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: add a common label property to
 all mtd devices
Message-ID: <20170116145258.17707912@bbrezillon>
In-Reply-To: <1484573225-19095-3-git-send-email-clg@kaod.org>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
 <1484573225-19095-3-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 16 Jan 2017 14:27:04 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> This can be used to easily identify a specific chip on a system with
> multiple chips.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  Documentation/devicetree/bindings/mtd/common.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/common.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documenta=
tion/devicetree/bindings/mtd/common.txt
> new file mode 100644
> index 000000000000..a781641a3b00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/common.txt
> @@ -0,0 +1,12 @@
> +* Common properties of all MTD devices
> +
> +Optional properties:
> +- label : name to assign to mtd. If omitted, the label is the MTD device=
 name.

Hm, the description is not really clear. How about:

"
- label: user-defined MTD device name. Can be used to assign user
  friendly names to MTD devices (instead of the flash model or flash
  controller based name) in order to ease flash device identification
  and/or describe what they are used for.
"

Otherwise,

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks,

Boris

> +
> +Example:
> +
> +	flash@0 {
> +		label =3D "System-firmware";
> +
> +		/* flash type specific properties */
> +	};
