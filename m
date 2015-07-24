Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIik4-0002Qx-V3
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 19:34:49 +0000
Received: by pdbnt7 with SMTP id nt7so17899981pdb.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 12:34:26 -0700 (PDT)
Date: Fri, 24 Jul 2015 12:34:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH_V3 0/2] mtd: nand: jz4780: Add nand and bch driver
Message-ID: <20150724193423.GJ8876@google.com>
References: <1427821181-40843-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <20150331172030.GE19571@brian-ubuntu> <551BBA9F.1010809@imgtec.com>
 <CAFLxGvxsatxukr0ohuWsbm9cgPSkL_aod8527Ue02kY-ksPyqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvxsatxukr0ohuWsbm9cgPSkL_aod8527Ue02kY-ksPyqg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 03, 2015 at 11:02:05AM +0200, Richard Weinberger wrote:
> On Wed, Apr 1, 2015 at 11:30 AM, Zubair Lutfullah Kakakhel
> <Zubair.Kakakhel@imgtec.com> wrote:
> > NEMC is going via greg-kh. They went through greg's char-misc-testing and
> > just got applied here.
> >
> > https://git.kernel.org/cgit/linux/kernel/git/gregkh/char-misc.git/log/?h=char-misc-next
> >
> > Do you think that can work for compile testing? It is the upstream tree with nemc.
> >
> > I could point our github ones for the ci20 board.
> > But it has quite a bit of other code too for jz4780 support.
> 
> what's the state of this driver? It would be nice to see it upstream.

Status: doesn't build against mainline. Looks like a lot of 'jz47xx...'
names changed to 'jz4780...'. Please resubmit.

Thanks,
Brian
