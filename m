Received: from mail-qk1-f195.google.com ([209.85.222.195])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH48d-00046t-B6
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2018 09:47:12 +0000
Received: by mail-qk1-f195.google.com with SMTP id d135so3427520qkc.12
 for <linux-mtd@lists.infradead.org>; Mon, 29 Oct 2018 02:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20181010184533.691620-1-arnd@arndb.de>
 <20181012111603.0d03e043@bbrezillon>
 <CAK8P3a1zYoGtfe6PVEM-oLNxXQAt12iiNR1ZLiaGvrY5LFKwwA@mail.gmail.com>
 <20181012112259.56f3c44f@bbrezillon>
 <CAGXu5jLS5sEFgM1Vzri+cAONYKUqdXbahyNUU1xvRF0cbZrX1w@mail.gmail.com>
 <20181029083004.54d535d2@bbrezillon>
In-Reply-To: <20181029083004.54d535d2@bbrezillon>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 29 Oct 2018 10:46:41 +0100
Message-ID: <CAK8P3a0Tu-dayaHMjUf1Cfo=2gn7Djphj8w7iamBPdcYC78ATA@mail.gmail.com>
Subject: Re: [PATCH] mtd: sa1100: avoid VLA in sa1100_setup_mtd
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 29, 2018 at 8:30 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> On Sun, 28 Oct 2018 19:13:26 -0700 Kees Cook <keescook@chromium.org> wrote:
> > On Fri, Oct 12, 2018 at 2:22 AM, Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> > > On Fri, 12 Oct 2018 11:19:52 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Fri, Oct 12, 2018 at 11:16 AM Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> > > Oh, I thought I'd let you send a v2, but I can do it if you prefer.
> >
> > Olof just pointed out to me that neither fix landed for this? What's
> > needed for this?
>
> Nothing in particular, I was planning on sending a new version after
> -rc1 is out and then queue it for 4.21 (5.1?) (this patch came in a bit
> late, and I had already stopped taking patches for 4.20).
>
> If you consider this a fix or want to have it in 4.20 for other reasons,
> just let me know and I'll queue it to the -fixes branch.

We generally try to have a kernel that can be built in any configuration
without warnings, so please add it for v4.20.

        Arnd
