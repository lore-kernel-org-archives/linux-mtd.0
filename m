Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OPftv-0002aA-C3
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2010 18:02:48 +0000
Received: by fxm11 with SMTP id 11so853597fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Jun 2010 11:02:45 -0700 (PDT)
Subject: Re: CRC error when mounting UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Leo Barnes <barnes.leo@gmail.com>
In-Reply-To: <AANLkTinzLo7e5sHOn7sFKRAZNZHWoi3TMMG-FslG-CVv@mail.gmail.com>
References: <AANLkTilGg81TGnkS2VwF6xdFCvsB_AF_8rLYVqTr-81g@mail.gmail.com>
	<1275575118.9729.2.camel@localhost.localdomain>
	<AANLkTim4K_-kJc4x7mlgyXG3DPgcWUR5-nb46SEpn3pG@mail.gmail.com>
	<1275579127.9729.6.camel@localhost.localdomain>
	<AANLkTinzLo7e5sHOn7sFKRAZNZHWoi3TMMG-FslG-CVv@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Jun 2010 21:02:41 +0300
Message-Id: <1276884161.2503.1.camel@localhost.localdomain>
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

On Fri, 2010-06-04 at 18:18 +0200, Leo Barnes wrote:
> Question:
> Would it be possible to make all buffers that are sent to mtd->read()
> DMA-friendly?

But of course if you just want to experiment, you may replace all
vmalloc()'s with kmallocs()' in both UBI and UBIFS, which can be good
enough to start playing with UBIFS.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
