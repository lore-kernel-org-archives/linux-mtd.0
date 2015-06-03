Received: from mail-vn0-x231.google.com ([2607:f8b0:400c:c0f::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z04ZA-0007xw-76
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2015 09:02:29 +0000
Received: by vnbf190 with SMTP id f190so337390vnb.5
 for <linux-mtd@lists.infradead.org>; Wed, 03 Jun 2015 02:02:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <551BBA9F.1010809@imgtec.com>
References: <1427821181-40843-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <20150331172030.GE19571@brian-ubuntu> <551BBA9F.1010809@imgtec.com>
Date: Wed, 3 Jun 2015 11:02:05 +0200
Message-ID: <CAFLxGvxsatxukr0ohuWsbm9cgPSkL_aod8527Ue02kY-ksPyqg@mail.gmail.com>
Subject: Re: [PATCH_V3 0/2] mtd: nand: jz4780: Add nand and bch driver
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zubair,

On Wed, Apr 1, 2015 at 11:30 AM, Zubair Lutfullah Kakakhel
<Zubair.Kakakhel@imgtec.com> wrote:
> NEMC is going via greg-kh. They went through greg's char-misc-testing and
> just got applied here.
>
> https://git.kernel.org/cgit/linux/kernel/git/gregkh/char-misc.git/log/?h=char-misc-next
>
> Do you think that can work for compile testing? It is the upstream tree with nemc.
>
> I could point our github ones for the ci20 board.
> But it has quite a bit of other code too for jz4780 support.

what's the state of this driver? It would be nice to see it upstream.

-- 
Thanks,
//richard
