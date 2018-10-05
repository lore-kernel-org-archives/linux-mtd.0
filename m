Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8SFO-0006es-Rp
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2018 15:42:44 +0000
Received: by mail-lj1-x242.google.com with SMTP id p89-v6so12036835ljb.3
 for <linux-mtd@lists.infradead.org>; Fri, 05 Oct 2018 08:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20181004142942.11887-1-ricardo.ribalda@gmail.com>
 <20181004142942.11887-2-ricardo.ribalda@gmail.com>
 <20181005002125.12fd229f@bbrezillon>
 <CAPybu_26HST5xGfhE6MoVTRZok_gfDqN=ZOAesuEMVskdrCpLA@mail.gmail.com>
 <20181005090811.6b7e9957@bbrezillon>
 <CAPybu_38xH2Cv+eONQmEJ1i6k=oiQM=WrcwOFR29LbtRvWfKXA@mail.gmail.com>
 <20181005103730.57d52e3c@bbrezillon>
 <CAPybu_1RMcro3xLNW5mbybYdObCTq=QwXgk+RT6hcmRGTh6s7A@mail.gmail.com>
 <20181005121235.7e64b64a@bbrezillon>
 <CAPybu_0TbeN+-F6zwN8XOMuY1EpgE6GRi=ExDx6O3Yun9kXjYQ@mail.gmail.com>
 <20181005172332.173791b5@bbrezillon>
In-Reply-To: <20181005172332.173791b5@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 5 Oct 2018 17:42:06 +0200
Message-ID: <CAPybu_3LxSuGm5F+=dgJvpLTpEZPDFsu8QEL3QdL=hzdMTGL=Q@mail.gmail.com>
Subject: Re: [PATCH v10 10/10] mtd: maps: gpio-addr-flash: Add support for
 device-tree devices
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI again!
On Fri, Oct 5, 2018 at 5:23 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Fri, 5 Oct 2018 14:04:52 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
>
> > Hi Boris
> > On Fri, Oct 5, 2018 at 12:12 PM Boris Brezillon
> > <boris.brezillon@bootlin.com> wrote:
> > >
> > > On Fri, 5 Oct 2018 11:54:18 +0200
> > > Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
> > >
> > > > Hi Boris
> > > >
> > > > Just seen that  you already did the rebase at
> > > > https://github.com/bbrezillon/linux-0day/commits/mtd/physmap-cleanup
> > > >
> > > > Thanks for that.
> > > >
> > > > I am about to test it in real hw (unless you want me wait)
> > >
> > > Sure, go ahead and test it.
> > >
> > > Thanks,
> > >
> > > Boris
> > I had to change this on your patchset to have it working on hw:
> > https://pastebin.com/78A7yhJ9
>
>
> I pushed a new version to my branch. Can you test it? The reboot
> notifier bug should still be present, but I don't think this is
> something we introduced.

I will do it next week, I already left the office and this weekend I
have a big 2 year old bday party .

Have a very nice weekend and thanks for your help!


-- 
Ricardo Ribalda
