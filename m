Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoHZe-0007VP-EB
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 19:57:58 +0000
Received: by mail-lb0-f170.google.com with SMTP id p9so5018993lbv.15
 for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2014 11:57:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwgy-+5K63re678JwcSy2-bNRtDHXiW-1Ve+1En5xHFYg@mail.gmail.com>
References: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>
 <CAFLxGvwgy-+5K63re678JwcSy2-bNRtDHXiW-1Ve+1En5xHFYg@mail.gmail.com>
Date: Tue, 11 Nov 2014 17:57:36 -0200
Message-ID: <CAOMZO5A2JJ+HAomy6qDZ6xLf2Bep8R6Jd7O5+N2GkQvtHhm8fg@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Remove noisy error message
From: Fabio Estevam <festevam@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 11, 2014 at 5:45 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Tue, Nov 11, 2014 at 5:01 PM, Fabio Estevam
> <fabio.estevam@freescale.com> wrote:
>> mx28evk board has a socket for NAND flash that comes with no NAND flash
>
> Wouldn't it make more sense to fix your board's devicetree/boardfile
> to not load the gpmi driver?

Then the people who populated the NAND flash in the socket would not
be able to use the NAND driver.

In my opinion, removing the error message would be better.
