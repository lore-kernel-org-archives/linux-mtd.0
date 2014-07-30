Received: from mail-vc0-x234.google.com ([2607:f8b0:400c:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCLTO-0000Gh-65
 for linux-mtd@lists.infradead.org; Wed, 30 Jul 2014 04:26:42 +0000
Received: by mail-vc0-f180.google.com with SMTP id ij19so990292vcb.11
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jul 2014 21:26:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <40bf530c679d46a4a0a73d3d22484f7c@CY1PR0301MB0857.namprd03.prod.outlook.com>
References: <1404795285-2929-1-git-send-email-Priyanka.Jain@freescale.com>
 <CAMuHMdV52qwThCezu=4NCpVBwbM2AjSK4cKXA+BdO=v_Yy2sBQ@mail.gmail.com>
 <20140730041431.GD11952@brian-ubuntu>
 <40bf530c679d46a4a0a73d3d22484f7c@CY1PR0301MB0857.namprd03.prod.outlook.com>
Date: Tue, 29 Jul 2014 21:26:20 -0700
Message-ID: <CAN8TOE9mA_XA2jgTNEofssy=4fL9RcKaKSRBhdJt54K0n7P3cw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Correct device-id for n25q512a device
From: Brian Norris <computersforpeace@gmail.com>
To: Priyanka Jain <Priyanka.Jain@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-spi <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 29, 2014 at 9:17 PM, Priyanka Jain
<Priyanka.Jain@freescale.com> wrote:
> Should I send another patch which just add
>> > > +       { "n25q512a",    INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K) },
> And let the original one as it is ?

No. We already have this entry queued up for 3.17:

+       { "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, USE_FSR) },

Feel free to test it out.

Brian
