Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZxYMa-00009L-Vn
 for linux-mtd@lists.infradead.org; Sat, 14 Nov 2015 10:47:23 +0000
Received: by obbbj7 with SMTP id bj7so73055088obb.1
 for <linux-mtd@lists.infradead.org>; Sat, 14 Nov 2015 02:46:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151113220039.GA74382@google.com>
References: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
 <20151029162908.GA13275@localhost>
 <CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg@mail.gmail.com>
 <20151030175145.GF13239@google.com>
 <CAL_JsqL2F3p7qBPbOiGytVyzF_aNLWbrCT0mAX1WZo6SxE3JoA@mail.gmail.com>
 <20151113220039.GA74382@google.com>
Date: Sat, 14 Nov 2015 11:46:59 +0100
Message-ID: <CACRpkdakyae95f_Lc-R7Uf7wndj5hyfCqqHziwmZjwm-uNkGAg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: create a partition type device tree binding
From: Linus Walleij <linus.walleij@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Michal Suchanek <hramrach@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 13, 2015 at 11:00 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

(...)
>  (2) we should define a comptible property for the hard-coded
>  partitioning case (e.g., compatible = "partitions")
(...)
> If we went with option (2), then ofpart.c could just check only for
> 'compatible = "partitions"' (or similar), and if not found bail out.

So this "hard-coded partitioning case" the case is where all partitions
are defined in the device tree as described in
Documentation/devicetree/bindings/mtd/partition.txt ?

Or is it a way to indicate that this array
static const char * const part_probe_types_def[] = {
        "cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
in physmap_of.c should be used?

Sorry if I don't fully follow, I'm a bit stupid when it comes to the MTD
helicopter  view of the situation.... :(

> I think option (2) makes more sense. But it would require an update to
> the binding and code for 4.4, since [1] was only introduced during this
> release cycle.

Does that mean all old device trees that specify no compatible
string all of a sudden stop working? We can't break the DT ABI, so I
guess not.

A bit confused here, I can't really see what I should do with the patch...

Yours,
Linus Walleij
