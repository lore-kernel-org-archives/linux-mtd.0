Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OKbDU-0008EN-98
	for linux-mtd@lists.infradead.org; Fri, 04 Jun 2010 18:02:00 +0000
Received: by fxm15 with SMTP id 15so1092689fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 Jun 2010 11:01:58 -0700 (PDT)
Subject: Re: CRC error when mounting UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Leo Barnes <barnes.leo@gmail.com>
In-Reply-To: <AANLkTimUrdHmrf5hblunbpI3J24A6tMQj1tIIXbSQoIy@mail.gmail.com>
References: <AANLkTilGg81TGnkS2VwF6xdFCvsB_AF_8rLYVqTr-81g@mail.gmail.com>
	<1275575118.9729.2.camel@localhost.localdomain>
	<AANLkTim4K_-kJc4x7mlgyXG3DPgcWUR5-nb46SEpn3pG@mail.gmail.com>
	<1275579127.9729.6.camel@localhost.localdomain>
	<AANLkTinzLo7e5sHOn7sFKRAZNZHWoi3TMMG-FslG-CVv@mail.gmail.com>
	<1275670996.9729.19.camel@localhost.localdomain>
	<AANLkTimUrdHmrf5hblunbpI3J24A6tMQj1tIIXbSQoIy@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 04 Jun 2010 21:01:53 +0300
Message-Id: <1275674513.9729.22.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-06-04 at 19:35 +0200, Leo Barnes wrote:
> > The way to fix this is to make UBI/UBIFS use arrays of pages instead. Or
> > array of 2, 4, 8, etc pages, or it may be flexible and contain a field
> > which describes the allocation order. And then UBI/UBIFS code should be
> > amended correspondingly.
> >
> > This will need some effort, but I think a skilled engineer would do this
> > relatively quickly. We are not actively working on UBI/UBIFS now, so we
> > will unlikely implement this, but I'd be happy to help someone else to
> > do this.
> >
> > Many people ask about small features like security xattrs, or NFS
> > support, or DMA friendliness, but it is strange that people want ready
> > solutions instead of investing a bit of time and just implementing this.
> 
> Sounds good, I might take a crack at it, I have been looking for some
> way to contribute to the linux kernel.
> 
> Have I understood the UBI code correctly in that only the
> ubi->peb_buf1, ubi->peb_buf2 and ubi->dbg_peb_buf are ever sent to the
> mtd->read/write functions? Currently at home and dont really have
> anything to test code in.

Yes, AFAIR. If you really will try to do this, let's discuss the
strategy.

> Does UBIFS ever access the mtd-layer directly?

No. In UBIFS getting rid of vmalloc will be more difficult because it'll
need to modify algorithms like GC which walks uses the buffers.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
