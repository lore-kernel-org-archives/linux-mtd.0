Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3ULV-0007Lc-E9
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 19:42:45 +0000
Received: by pacdm15 with SMTP id dm15so194272532pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 11:42:24 -0800 (PST)
Date: Mon, 30 Nov 2015 11:42:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stable <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: include mtd.h header for struct mtd_info
 definition
Message-ID: <20151130194222.GH64635@google.com>
References: <1448525104-20101-1-git-send-email-zajec5@gmail.com>
 <CACna6rxs==Be4Ua_AUuqZgc8ey0DYXrgUOe=7TqxBEEF7AOzKw@mail.gmail.com>
 <20151127223340.GB19615@localhost>
 <CACna6ryU3AorbbL3f7REVueREHJZMfZpvoZs0ijVj1SNG4Z6ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6ryU3AorbbL3f7REVueREHJZMfZpvoZs0ijVj1SNG4Z6ng@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 28, 2015 at 03:05:26PM +0100, Rafał Miłecki wrote:
> On 27 November 2015 at 23:33, Brian Norris <computersforpeace@gmail.com> wrote:
> > On Fri, Nov 27, 2015 at 10:25:55AM +0100, Rafał Miłecki wrote:
> >> On 26 November 2015 at 09:05, Rafał Miłecki <zajec5@gmail.com> wrote:
> >> > Fixes: 1976367173a4 ("mtd: spi-nor: embed struct mtd_info within struct spi_nor")
> >
> > I'm not 100% sure, but I thought I recall the -stable folks picking up
> > for-linus commits just based on the 'Fixes:' tags. I feel like that
> > isn't always ideal, though.
> 
> I'm confused. Do you mean I shouldn't include it?

No, the 'Fixes' usage is fine. I'm just not clear what importance is
placed on it by others.

> Do you have a reference to more detailed Fixes usage? All I found is
> info in Documentation/SubmittingPatches:
> > If your patch fixes a bug in a specific commit, e.g. you found an issue using
> > git-bisect, please use the 'Fixes:' tag
> I think 'Fixes' usage is OK in this case.

I don't have any better reference. Perhaps I'm completely mistaken, and
'Fixes' is never taken as the sole source of for-stable annotation.

Brian
