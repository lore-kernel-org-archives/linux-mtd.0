Date: Wed, 23 Oct 2013 03:03:03 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH, RFC] what's the point of mtd_inodefs?
Message-ID: <20131023100303.GA20373@infradead.org>
References: <20131022153313.GA11923@infradead.org>
 <CAFLxGvwk0gbejxk6hmnu+Cw=TgXGh0=MKgSyKtm7nTVJiBBgeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvwk0gbejxk6hmnu+Cw=TgXGh0=MKgSyKtm7nTVJiBBgeg@mail.gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 kirill@shutemov.name
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 23, 2013 at 07:50:17AM +0200, Richard Weinberger wrote:
> On Tue, Oct 22, 2013 at 5:33 PM, Christoph Hellwig <hch@infradead.org> wrote:
> > I've been looking at mtdchar as part of a bigger series touching all
> > kidns of places and really wonder what the point of mtd_inodefs is.
> 
> As far I can tell it was introduced because of that issue:
> http://lists.infradead.org/pipermail/linux-mtd/2010-April/029593.html

Not sure how that issue came up as writeback only ever uses
mapping->backing_dev_info for block devices, else it only uses s_bdi to
avoid this issue.  As pointed out somewhere in that thread the mem
driver uses a similar scheme.
