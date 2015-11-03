Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtiyV-0002Xy-VK
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 21:18:40 +0000
Date: Tue, 3 Nov 2015 22:18:12 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Renaud Barbier <renaud.barbier@ge.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: nand_flash_detect_onfi error
Message-ID: <20151103221812.013b5cc0@bbrezillon>
In-Reply-To: <CAAEAJfD3_TW4C6p7XU4bWrWxrhg4YRf-YK2QZu_vT3d7uwS4mw@mail.gmail.com>
References: <5638E074.5070800@ge.com>
 <CAAEAJfAjs0k26QumQdDzHeMGAM2s=xJw4E8N+yhs5GMCFkK=Aw@mail.gmail.com>
 <20151103212546.0184eaf6@bbrezillon>
 <CAAEAJfD3_TW4C6p7XU4bWrWxrhg4YRf-YK2QZu_vT3d7uwS4mw@mail.gmail.com>
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

On Tue, 3 Nov 2015 17:59:01 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> On 3 November 2015 at 17:25, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> [..]
> >
> > Hm, sorry but I don't like this idea. ->cmdfunc() is not supposed to
> > retrieve any data before ->read_xxx() is called. I know some
> > controllers retrieve data ahead of time and then provide the previously
> > stored data when ->read_buf() is called, but that's not a good practice
> > to assume it will work this way on all controllers (actually I keep
> > thinking the sane implementations are those waiting for the
> > ->read_buf() call before starting retrieving the data from the NAND
> > chip).
> >
> 
> Right. We've discussed this in the past, and although I don't recall
> the details,
> I recall you were right.
> 
> In any case, I just wanted to mention that if Renaud is getting
> a read beyond the buffer, then probably the driver needs fixing.
> 

My bad, I thought the "read beyond the buffer" thing mentioned by
Renaud was something generic. Now I get your point, and I agree: it
should be fixed in the NAND controller driver, either by increasing the
read buffer or by reworking the implementation to delay data retrieval
until ->read_buf() is called.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
