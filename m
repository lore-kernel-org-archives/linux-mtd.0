Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drKYV-00027a-GH
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 08:59:02 +0000
Received: by mail-pg0-x232.google.com with SMTP id v66so14194901pgb.5
 for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2017 01:58:38 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <e9e925ab-e543-23fd-a738-a9ce433de713@wedev4u.fr>
References: <CAMuHMdXKpheF5whZi2Ot2Pm8t3Lu+ramNV==sXBo87u_HerZxQ@mail.gmail.com>
 <20170907185456.4631-1-cyrille.pitchen@wedev4u.fr>
 <e9e925ab-e543-23fd-a738-a9ce433de713@wedev4u.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Sep 2017 10:58:36 +0200
Message-ID: <CAMuHMdVgdLt5yhgJnDamcMDUv+-JhLEuO9Gj3trmXZwPhhP2tg@mail.gmail.com>
Subject: Re: [DEBUG] mtd: spi-nor: dump DWORDs of the Basic Flash Parameter
 Table
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

On Thu, Sep 7, 2017 at 9:28 PM, Cyrille Pitchen
<cyrille.pitchen@wedev4u.fr> wrote:
>> Can you apply this patch on your tree then report me what was printed, please?
>> I have an idea of the root cause of your issue then a potential work-around
>> but I first need to validate my assumption to confirm that the work-around
>> would actually work.

+m25p80 spi0.0: DWORD1 = 0xffffffff
+m25p80 spi0.0: DWORD2 = 0xffffffff
+m25p80 spi0.0: DWORD3 = 0xffffffff
+m25p80 spi0.0: DWORD4 = 0xffffffff
+m25p80 spi0.0: DWORD5 = 0xffffffff
+m25p80 spi0.0: DWORD6 = 0xffffffff
+m25p80 spi0.0: DWORD7 = 0xffffffff
+m25p80 spi0.0: DWORD8 = 0xffffffff
+m25p80 spi0.0: DWORD9 = 0xffffffff
+m25p80 spi0.0: DWORD10 = 0x00000000
+m25p80 spi0.0: DWORD11 = 0x00000000
+m25p80 spi0.0: DWORD12 = 0x00000000
+m25p80 spi0.0: DWORD13 = 0x00000000
+m25p80 spi0.0: DWORD14 = 0x00000000
+m25p80 spi0.0: DWORD15 = 0x00000000
+m25p80 spi0.0: DWORD16 = 0x00000000
+m25p80 spi0.0: BFPT version 1.0 (length = 9)

> If you could also dump the value of the 'addr' argument of
> spi_nor_read_sfdp_dma_unsafe() just before the for () loop below in the
> very same function. Actually, I suspect the SFDP tables of your SPI NOR

+m25p80 spi0.0: addr = 0x448

> memory sample to have been programmed with invalid values, neither
> compliant with the JEDEC JESD216 specification nor with the Cypress
> datasheet for this memory part.

Sounds plausible.
I get the same values when disabling DMA, so it's not due to bad DMA handling.
All Renesas boards I have local or remote access to have spansion,s25fl512s.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
