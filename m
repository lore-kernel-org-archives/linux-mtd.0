Received: from mail-lb0-x236.google.com ([2a00:1450:4010:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xtb1Z-0002G5-HK
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 11:44:46 +0000
Received: by mail-lb0-f182.google.com with SMTP id f15so2509056lbj.13
 for <linux-mtd@lists.infradead.org>; Wed, 26 Nov 2014 03:44:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20141126031823.GQ24364@ld-irv-0074>
References: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>
 <CAFLxGvwgy-+5K63re678JwcSy2-bNRtDHXiW-1Ve+1En5xHFYg@mail.gmail.com>
 <CAOMZO5A2JJ+HAomy6qDZ6xLf2Bep8R6Jd7O5+N2GkQvtHhm8fg@mail.gmail.com>
 <54626AF4.4090306@nod.at>
 <CAOMZO5AXMjTPPnQtnZUxRmBezoq32wLSCX0iJ30PWa1dZhJ7qQ@mail.gmail.com>
 <54626D23.1080003@nod.at>
 <CAOMZO5C3STv-ZsTyXhxs2rhUMM7nu+kuzdAtV_Fo9c5azdeAuA@mail.gmail.com>
 <20141126031823.GQ24364@ld-irv-0074>
Date: Wed, 26 Nov 2014 09:44:23 -0200
Message-ID: <CAOMZO5C_9er34oqGCYWfhe3NvmJXfqC21s_Uiset7_y7NKHXXA@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Remove noisy error message
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Richard Weinberger <richard@nod.at>, Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 26, 2014 at 1:18 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Tue, Nov 11, 2014 at 06:16:29PM -0200, Fabio Estevam wrote:
>> BTW, I don't see any other nand driver that prints error on the probe
>> error path like this one.
>
> You're probably still going to see failure prints like
>
>   nand: No NAND device found
>
> in nand_scan_ident(), right? Or does driver probe fail earlier than that
> somehow?

Yes, this is what I get currently:

[    1.645433] nand: No NAND device found
[    1.650372] gpmi-nand 8000c000.gpmi-nand: driver registration failed: -19

In my opinion the "No NAND device found" is enough.

Thanks
