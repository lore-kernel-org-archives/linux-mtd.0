Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDoZl-0000b2-BL
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 08:24:42 +0000
Date: Mon, 5 Dec 2016 09:23:40 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Joe Perches <joe@perches.com>,
 Marek Vasut <marek.vasut@gmail.com>, Pan Bian <bianpan201604@163.com>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Pan Bian
 <bianpan2016@163.com>
Subject: Re: [PATCH 1/1] mtd: ubi: fix improper return value
Message-ID: <20161205092340.6c119305@bbrezillon>
In-Reply-To: <1480921774.2583.351.camel@gmail.com>
References: <1480831930-5449-1-git-send-email-bianpan201604@163.com>
 <c56efbcf-9398-0299-35d7-929f9a8c3dd6@gmail.com>
 <1480883619.4534.6.camel@perches.com>
 <0446c91c-ac84-3601-203a-9c2e7057f1f9@nod.at>
 <1480921774.2583.351.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 05 Dec 2016 09:09:34 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Sun, 2016-12-04 at 21:52 +0100, Richard Weinberger wrote:
> > We should better think about how to get ubi_self_check_all_ff()
> > fixed.
> > When enabled on a modern NAND, vmalloc() is likely to fail now and
> > then
> > since len is the erase block size and can be up to a few mega bytes.  
> 
> I did an attempt to switch from virtually continuous buffers to an
> array of page pointers, but never finished.

I started to implement that too but unfortunately never had the time to
finish it :-(.
Don't know why you were trying to move to kzalloc-ed buffer, but my
goal was to avoid the extra copy when the controller transfers data
using DMA, and the recent posts regarding vmalloc-ed buffers and DMA
might solve the issue.

This being said, UBI and UBIFS tend to allocate big portions of
memory (usually a full eraseblock), and sometime this is
overkill.
For example, I'm not sure we need to allocate that much memory to do
things like 'check if this portion is all filled with 0xff'. Allocating
a ->max_write_size buffer and iterating over write-units should be
almost as efficient and still consume less memory. But this has nothing
to do with the vmalloc vs kmalloc debate ;-).
