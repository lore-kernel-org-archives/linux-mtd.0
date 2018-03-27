Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0skx-0004g2-S8
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 17:51:37 +0000
Received: by mail-it0-x241.google.com with SMTP id v194-v6so305086itb.0
 for <linux-mtd@lists.infradead.org>; Tue, 27 Mar 2018 10:51:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180303222903.27767-1-linus.walleij@linaro.org>
References: <20180303222903.27767-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Mar 2018 19:51:24 +0200
Message-ID: <CACRpkdb2UsX9bqA1j9i6z_QxmnLDM45xCnninvGf_vdhEN=r3g@mail.gmail.com>
Subject: Re: [PATCH] mtd: jedec_probe: Fix crash in jedec_read_mfr()
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 3, 2018 at 11:29 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> It turns out that the loop where we read manufacturer
> jedec_read_mfd() can under some circumstances get a
> CFI_MFR_CONTINUATION repeatedly, making the loop go
> over all banks and eventually hit the end of the
> map and crash because of an access violation:
>
> Unable to handle kernel paging request at virtual address c4980000
> pgd = (ptrval)
> [c4980000] *pgd=03808811, *pte=00000000, *ppte=00000000
> Internal error: Oops: 7 [#1] PREEMPT ARM
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.16.0-rc1+ #150
> Hardware name: Gemini (Device Tree)
> PC is at jedec_probe_chip+0x6ec/0xcd0
> LR is at 0x4
> pc : [<c03a2bf4>]    lr : [<00000004>]    psr: 60000013
> sp : c382dd18  ip : 0000ffff  fp : 00000000
> r10: c0626388  r9 : 00020000  r8 : c0626340
> r7 : 00000000  r6 : 00000001  r5 : c3a71afc  r4 : c382dd70
> r3 : 00000001  r2 : c4900000  r1 : 00000002  r0 : 00080000
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 0000397f  Table: 00004000  DAC: 00000053
> Process swapper (pid: 1, stack limit = 0x(ptrval))
>
> Fix this by breaking the loop with a return 0 if
> the offset exceeds the map size.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Could someone maintaining MTD please pick up this bug fix?

It is a very real problem to me.

Yours,
Linus Walleij
