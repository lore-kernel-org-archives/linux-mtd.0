Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOMMS-0003as-RX
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2016 09:26:02 +0000
Received: by mail-ob0-x235.google.com with SMTP id ba1so2270638obb.3
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2016 01:25:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160126113707.GL10826@n2100.arm.linux.org.uk>
References: <1453806725-4880-1-git-send-email-linus.walleij@linaro.org>
 <1453806725-4880-3-git-send-email-linus.walleij@linaro.org>
 <20160126113707.GL10826@n2100.arm.linux.org.uk>
Date: Wed, 27 Jan 2016 10:25:39 +0100
Message-ID: <CACRpkdYnWiARgFACZ0P_m+awTPbUf5yoQSawphRiKkWRV8ZD1Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] mtd: physmap_of: add a hook for Versatile write
 protection
From: Linus Walleij <linus.walleij@linaro.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 26, 2016 at 12:37 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Jan 26, 2016 at 12:12:01PM +0100, Linus Walleij wrote:
>> Solve this by looking for the arm,versatile-flash compatible
>> string in the flash device tree node. In the driver,
>> add a special hook to check for the various Versatile syscons and
>> register a callback for .set_vpp() if this compatible is present.
>
> You are aware that the "write enable" applies to all flash devices
> on the board, and not just NOR flash.  What that means is if you
> have drivers for the other flash devices, you need to have a way
> to enable writes when _any_ driver wants write access.
>
> So, it shouldn't be part of the flash driver at all.

Yes this is correct ... I put in the current code to be able to
test writes on the hardware. As to actually write to flash on
the Integrator both flags must be set to 1.

I don't see why it would just be a problem just for write
enable though, as I guess the VPP bit is *also* shared by all
devices?

After
commit 876fe76d793d03077
"mtd: maps: physmap: Add reference counter to set_vpp()"

As long as the flash devices are all physmap this reference
counter should hold VPP+WP enabled with this code as
long as any flash device has called .set_vpp().

It is a bit unintuitive that .set_vpp() is named like that though.
.enable_write() or something would be better I guess.
(The reference count also makes it start to reimplement
the regulator infrastructure.)

Yours,
Linus Walleij
