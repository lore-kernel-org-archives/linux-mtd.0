Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBm8P-0005YC-Iz
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2016 17:24:04 +0000
Received: by mail-wm0-x243.google.com with SMTP id u144so25417093wmu.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2016 09:23:40 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20161129170949.GZ1555@brightrain.aerifal.cx>
References: <1480059181-29355-1-git-send-email-horms+renesas@verge.net.au>
 <20161129170949.GZ1555@brightrain.aerifal.cx>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Nov 2016 18:23:38 +0100
Message-ID: <CAMuHMdUnaXbG-4GFB0BcTpYjcKHh8xA3Z0Z5CwiHJqCT-QhBJA@mail.gmail.com>
Subject: Re: [PATCH/RFC linux-mtd] mtd: sh_flctl: Remove sh7372 and device
 tree support
To: Rich Felker <dalias@libc.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rich,

On Tue, Nov 29, 2016 at 6:09 PM, Rich Felker <dalias@libc.org> wrote:
> On Fri, Nov 25, 2016 at 08:33:01AM +0100, Simon Horman wrote:
>> Commit edf4100906044225 ("ARM: shmobile: sh7372 dtsi: Remove Legacy file")
>> removed the sh7272 SoC from the kernel in v4.1.
>>
>> This patch removes support for the sh7272 SoC from the sh_flctl driver.
>> As that SoC was the only user of device tree support also remove that
>> from the driver.
>>
>> In essence it reverts commit 7c8f680e96ed ("mtd: sh_flctl: Add device tree
>> support"). This commit may be used as a reference for re-adding device
>> tree support to this driver if a need for it is found in future.
>>
>> This commit has been build-testesd against the ap325rxa_defconfig.
>> I do not have access to the hardware to perform run-time testing
>> on that board which appears to be the only remaining user of this driver.
>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>> ---
>>  .../devicetree/bindings/mtd/flctl-nand.txt         | 49 ---------------
>>  drivers/mtd/nand/sh_flctl.c                        | 70 +++-------------------
>>  2 files changed, 8 insertions(+), 111 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/mtd/flctl-nand.txt
>
> While I'm not the maintainer for this (and I'm not clear that the
> linux-sh list even should have been cc'd; it seems to be shmobile arm
> soc stuff rather than sh arch) I think this is a bad change. If the
> driver is completely unused, it should just be removed, but if there

Its sole remaining in-kernel user is arch/sh/boards/mach-ap325rxa/setup.c.

> are remaining users that are still using legacy platform device
> bindings, they should gradually be transitioned to device tree, and
> having the device tree support still present makes it easier to do
> that.

Enjoy converting ap325rxa to DT ;-)

> Removing the *bindings* is even worse, as these are a permanent
> interface between hardware/firmware and software.

While it is a permanent interface, it is only a git revert away...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
