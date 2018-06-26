Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXoqi-0006pq-60
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2018 14:21:41 +0000
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
 [209.85.223.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8B74257C5
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2018 14:21:28 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id r24-v6so16120237ioh.9
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2018 07:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180612104434.15232-1-zajec5@gmail.com>
 <20180625220508.21242-1-zajec5@gmail.com>
In-Reply-To: <20180625220508.21242-1-zajec5@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 26 Jun 2018 08:21:16 -0600
Message-ID: <CAL_JsqJV9c0QsPKeXvfbDrGDsFsTVOvBbCoGFetK5OPVgn+0Ng@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: mtd: document Broadcom's TRX firmware
 format binding
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mark Rutland <mark.rutland@arm.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 25, 2018 at 4:07 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Broadcom based home router devices use TRX firmware format. It's a
> container that can hold few partitions. If operating system is expected
> to access them it has to understand that format and parse flash data
> accordingly.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
> V2: Drop unneeded "brcm,trx-v1" and "brcm,trx-v2" bindings.
> ---
>  .../bindings/mtd/partitions/brcm,trx.txt           | 37 ++++++++++++++++=
++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm=
,trx.txt

Reviewed-by: Rob Herring <robh@kernel.org>
