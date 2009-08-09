Subject: Re: [UBI UBIFS] replace vmalloc with kmalloc
From: Artem Bityutskiy <dedekind1@gmail.com>
To: JiSheng Zhang <jszhang3@gmail.com>
In-Reply-To: <20090807232846.34bffdeb@ustc>
References: <2df346410908070202i6c16008ckc145559a474129c6@mail.gmail.com>
	<4A7BF1C3.4050602@nokia.com>  <20090807232846.34bffdeb@ustc>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 09 Aug 2009 08:35:32 +0300
Message-Id: <1249796132.9157.52.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"rmk@arm.linux.org.uk" <rmk@arm.linux.org.uk>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-08-07 at 23:28 +0800, JiSheng Zhang wrote:
> Adrian Hunter <adrian.hunter@nokia.com> wrote:
> > 
> > vmalloc allows large (> 128KiB) buffers, but kmalloc doesn't.
> > So we presently have no choice but to use vmalloc.
> 
> But vmalloced buffer can't be easily passed to DMA, is there better choice?

We use vmalloc-ed buffers is when we need to do something with whole
eraseblocks, which may be 128KiB, or even 256KiB. So in general, we
cannot just s/kmalloc/vmalloc/. We should invent something trickier.

You should probably think about some generic way to solve problems like
this. May be some MTD-specific library could be created. You could
implement something like the flexible arrays, but with DMA stuff in mind
(e.g., adding a parameter which specifies allocation order, because for
DMA you may want to allocate more than one physically contiguous page).
Or you may even improve the existing flexible arrays to suit your needs.
Take a look here:
http://lwn.net/Articles/345273/

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
