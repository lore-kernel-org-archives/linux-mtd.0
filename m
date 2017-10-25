Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e7Njp-0005ll-OG
 for linux-mtd@lists.infradead.org; Wed, 25 Oct 2017 15:37:04 +0000
Received: by mail-qt0-x22d.google.com with SMTP id j58so560660qtj.0
 for <linux-mtd@lists.infradead.org>; Wed, 25 Oct 2017 08:36:41 -0700 (PDT)
Date: Wed, 25 Oct 2017 11:36:38 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Chris Brandt <chris.brandt@renesas.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 0/5] unconfuse get_unmapped_area and point/unpoint
 driver methods
In-Reply-To: <CAFLxGvwdZe5pxqiULuO0sZXSOOFP0kqg=uvkt1d+k2nMUvfOqg@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1710251131530.3238@knanqh.ubzr>
References: <20171017152826.11658-1-nicolas.pitre@linaro.org>
 <nycvar.YSQ.7.76.1710241321450.3238@knanqh.ubzr>
 <CAFLxGvwdZe5pxqiULuO0sZXSOOFP0kqg=uvkt1d+k2nMUvfOqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 25 Oct 2017, Richard Weinberger wrote:

> On Tue, Oct 24, 2017 at 7:22 PM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> >
> > Ping.
> 
> I'm currently at ELCE and not really active.
> But your patches are not in /dev/null. :-)

OK, thanks for confirming.  I just want to not miss the next merge 
window as some other patches already queued for mainline rely on those 
MTD patches to work properly.


Nicolas
