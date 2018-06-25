Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXZOV-0008Uq-Ui
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2018 21:51:33 +0000
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
 [209.85.223.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7D5E261B0
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2018 21:51:20 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id i23-v6so11085035iog.10
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2018 14:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20180612104434.15232-1-zajec5@gmail.com>
 <20180625212137.GA16487@rob-hp-laptop>
 <623424b397965cea5f85ccbabdda3ef6@milecki.pl>
In-Reply-To: <623424b397965cea5f85ccbabdda3ef6@milecki.pl>
From: Rob Herring <robh@kernel.org>
Date: Mon, 25 Jun 2018 15:51:07 -0600
Message-ID: <CAL_JsqKZWrmQM9C+iDe5vjWtiYvTR3HQ_ANdUNa4kkfduzhODw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: document Broadcom's TRX firmware
 format binding
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mark Rutland <mark.rutland@arm.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>
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

On Mon, Jun 25, 2018 at 3:41 PM Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl> =
wrote:
>
> On 2018-06-25 23:21, Rob Herring wrote:
> > On Tue, Jun 12, 2018 at 12:44:33PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> >> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >>
> >> Broadcom based home router devices use TRX firmware format. It's a
> >> container that can hold few partitions. If operating system is
> >> expected
> >> to access them it has to understand that format and parse flash data
> >> accordingly.
> >>
> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >> ---
> >>  .../bindings/mtd/partitions/brcm,trx.txt           | 35
> >> ++++++++++++++++++++++
> >>  1 file changed, 35 insertions(+)
> >>  create mode 100644
> >> Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
> >> b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
> >> new file mode 100644
> >> index 000000000000..e590b884e5ac
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt
> >> @@ -0,0 +1,35 @@
> >> +Broadcom TRX Container Partition
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +TRX is Broadcom's official firmware format for the BCM947xx boards.
> >> It's used by
> >> +most of the vendors building devices based on Broadcom's BCM47xx SoCs
> >> and is
> >> +supported by the CFE bootloader.
> >> +
> >> +Design of the TRX format is very minimalistic. Its header contains
> >> +identification fields, CRC32 checksum and the locations of embedded
> >> partitions.
> >> +Its purpose is to store a few partitions in a format that can be
> >> distributed as
> >> +a standalone file and written in a flash memory.
> >> +
> >> +Container can hold up to 4 partitions. The first partition has to
> >> contain a
> >> +device executable binary (e.g. a kernel) as it's what the CFE
> >> bootloader starts
> >> +executing. Other partitions can be used for operating system
> >> purposes. This is
> >> +useful for systems that keep kernel and rootfs separated.
> >> +
> >> +TRX doesn't enforce any strict partition boundaries or size limits.
> >> All
> >> +partitions have to be less than the 4GiB max size limit.
> >> +
> >> +There are two existing/known TRX variants:
> >> +1) v1 which contains 3 partitions
> >> +2) v2 which contains 4 partitions
> >> +
> >> +Required properties:
> >> +- compatible : (required) must be either: "brcm,trx-v1" or
> >> "brcm,trx-v2"
> >> +    followed by "brcm,trx"
> >
> > What is the purpose of brcm,trx? Either that alone is enough or you
> > need
> > v1/v2 to distinguish the difference. You shouldn't need both.
>
> I guess I incorrectly tried some pattern I saw when specifying SoC
> compatibility.
>
> Can I have you advise here, please?
>
> No TRX supporting code really needs a hint about used TRX version. TRX
> format (header) contains "version" field so any code dealing with TRX
> format can check that field. Then it knows what version it's dealing
> with.
>
> Which binding(s) should I use in that case?

I'd just use "brcm,trx" then.

Rob
