Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6h25-0000HF-CD
 for linux-mtd@lists.infradead.org; Sat, 28 May 2016 16:24:14 +0000
Received: by mail-oi0-x235.google.com with SMTP id k23so216453884oih.0
 for <linux-mtd@lists.infradead.org>; Sat, 28 May 2016 09:23:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5749BC8B.4010608@gmail.com>
References: <1464429250-27670-1-git-send-email-keguang.zhang@gmail.com>
 <20160528141213.6da8e461@bbrezillon> <5749BC8B.4010608@gmail.com>
Date: Sat, 28 May 2016 08:23:51 -0800
Message-ID: <CA+uuBqYNHUg2-ttLmezS=M-DHfrXDUw9dR5EPoaosOBKno68Mg@mail.gmail.com>
Subject: Re: [PATCH V3] mtd: nand: add Loongson1 NAND driver
From: Mychaela Falconia <mychaela.falconia@gmail.com>
To: Kelvin Cheung <keguang.zhang@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/28/16, Kelvin Cheung <keguang.zhang@gmail.com> wrote:
> I have the same feeling as Mychaela, and suffered from the 'high-level
> controllers' as well.

Actually your controller is not as bad as mine: given that you set ECC
to "soft" in your driver, I assume that albeit it goes through DMA and
high-level commands, your controller still returns the bytes as they
come from the NAND chip on page reads and you get to supply all of the
bytes that get written into the NAND chip, so you get to do your own
ECC and thus the code in the generic NAND layer that distinguishes
between normal vs. raw reads and writes becomes sensibly applicable.

The controller I am working with is worse in that it absolutely does
NOT allow raw access to the full range of bytes in the physical NAND
pages: it *forces* you to use their hardware ECC engine along with the
proprietary on-flash data format it implements. In the driver which I
implemented by attaching directly to MTD and foregoing the generic
NAND layer, my implementation of read_oob and write_oob MTD methods
returns -EOPNOTSUPP if someone requests MTD_OPS_RAW, as the controller
hardware absolutely precludes the possibility of such raw access.

M~
