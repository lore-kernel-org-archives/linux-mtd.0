Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5BIE-0003Nb-Mo
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 11:46:23 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 79282280BEB
 for <linux-mtd@lists.infradead.org>; Sat,  5 Dec 2015 12:45:52 +0100 (CET)
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
 [209.85.217.180])
 by arrakis.dune.hu (Postfix) with ESMTPSA id AF10B28089B
 for <linux-mtd@lists.infradead.org>; Sat,  5 Dec 2015 12:45:49 +0100 (CET)
Received: by lbbed20 with SMTP id ed20so19465020lbb.2
 for <linux-mtd@lists.infradead.org>; Sat, 05 Dec 2015 03:45:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1449194529-145705-2-git-send-email-computersforpeace@gmail.com>
References: <1449194529-145705-1-git-send-email-computersforpeace@gmail.com>
 <1449194529-145705-2-git-send-email-computersforpeace@gmail.com>
From: Jonas Gorski <jogo@openwrt.org>
Date: Sat, 5 Dec 2015 12:45:36 +0100
Message-ID: <CAOiHx=kP8hT-UH=tfUZYYpr__i458-ZL3bOhcAJb8hmSbqBdCA@mail.gmail.com>
Subject: Re: [PATCH for-4.4 2/2] doc: dt: mtd: partitions: add compatible
 property to "partitions" node
To: Brian Norris <computersforpeace@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Simon Arlott <simon@fire.lp0.eu>, Michal Suchanek <hramrach@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 4, 2015 at 3:02 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> As noted here [1], there are potentially future conflicts if we try to
> use MTD's "partitions" subnode to describe anything besides just the
> fixed-in-the-device-tree partitions currently described in this
> document. Particularly, there was a proposal to use this node for the
> AFS parser too.
>
> It can pose a (small) problem to try to differentiate the following
> nodes:
>
>         // using binding as currently specified
>         partitions {
>                 #address-cells = <x>;
>                 #size-cells = <y>;
>                 partition@0 {
>                         ...;
>                 };
>         };
>
> and
>
>         // proposed future binding
>         partitions {
>                 compatible = "arm,arm-flash-structure";
>         };
>
> It's especially difficult if other uses of this node start having
> subnodes.
>
> So, since the "partitions" node is new in v4.4, let's fixup the binding
> before release so that it requires a compatible property, so it's much
> clearer to distinguish. e.g.:
>
>         // proposed
>         partitions {
>                 compatible = "partitions";

"partitions" sounds mode like a device_type thing than a compatible
name, maybe "fixed-partitions"? IMHO that would describe better what
these are, and doesn't invite to think using compatible =
"arm,arm-flash-structure", "partitions"; is a good idea.

>                 #address-cells = <x>;
>                 #size-cells = <y>;
>                 partition@0 {
>                         ...;
>                 };
>         };


Jonas
