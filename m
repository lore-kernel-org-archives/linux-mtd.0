Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDpuf-0001Yi-4K
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 09:50:21 +0000
Message-ID: <1480931395.2583.359.camel@gmail.com>
Subject: Re: [PATCH 1/1] mtd: ubi: fix improper return value
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, Joe Perches <joe@perches.com>,
 Marek Vasut <marek.vasut@gmail.com>, Pan Bian <bianpan201604@163.com>,
 David Woodhouse <dwmw2@infradead.org>,  Brian Norris
 <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Pan Bian
 <bianpan2016@163.com>
Date: Mon, 05 Dec 2016 11:49:55 +0200
In-Reply-To: <20161205092340.6c119305@bbrezillon>
References: <1480831930-5449-1-git-send-email-bianpan201604@163.com>
 <c56efbcf-9398-0299-35d7-929f9a8c3dd6@gmail.com>
 <1480883619.4534.6.camel@perches.com>
 <0446c91c-ac84-3601-203a-9c2e7057f1f9@nod.at>
 <1480921774.2583.351.camel@gmail.com> <20161205092340.6c119305@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2016-12-05 at 09:23 +0100, Boris Brezillon wrote:
> I started to implement that too but unfortunately never had the time
> to
> finish it :-(.
> Don't know why you were trying to move to kzalloc-ed buffer, but my
> goal was to avoid the extra copy when the controller transfers data
> using DMA, and the recent posts regarding vmalloc-ed buffers and DMA
> might solve the issue.

Yes, I wanted to do that globally for UBI/UBIFS to get rid of vmalloc.

> This being said, UBI and UBIFS tend to allocate big portions of
> memory (usually a full eraseblock), and sometime this is
> overkill.

Those checks were just hacky debugging functions at the beginning, then
they got cleaned up without a re-write.

> For example, I'm not sure we need to allocate that much memory to do
> things like 'check if this portion is all filled with 0xff'. 

Because memcmp() is was very easy to use. Back then the focus was
getting other things work well, and efforts were saved on less
important parts. And 128KiB was not terribly bad. Today, these less
important things are important.

> Allocating
> a ->max_write_size buffer and iterating over write-units should be
> almost as efficient and still consume less memory. But this has
> nothing
> to do with the vmalloc vs kmalloc debate ;-).

Well, this is related. Someone may start small and take care of these
first :-)

Artem.
