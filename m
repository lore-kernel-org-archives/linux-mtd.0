Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a2Rae-0003jE-2h
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2015 22:34:04 +0000
Received: by pacdm15 with SMTP id dm15so124355261pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 27 Nov 2015 14:33:43 -0800 (PST)
Date: Fri, 27 Nov 2015 14:33:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: include mtd.h header for struct mtd_info
 definition
Message-ID: <20151127223340.GB19615@localhost>
References: <1448525104-20101-1-git-send-email-zajec5@gmail.com>
 <CACna6rxs==Be4Ua_AUuqZgc8ey0DYXrgUOe=7TqxBEEF7AOzKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rxs==Be4Ua_AUuqZgc8ey0DYXrgUOe=7TqxBEEF7AOzKw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 27, 2015 at 10:25:55AM +0100, Rafał Miłecki wrote:
> On 26 November 2015 at 09:05, Rafał Miłecki <zajec5@gmail.com> wrote:
> > So far struct spi_nor was using just a pointer to struct mtd_info so it
> > wasn't needed to have it fully defined there. After recent change we
> > embed whole struct so we need to include a proper header.

Good catch.

> > Fixes: 1976367173a4 ("mtd: spi-nor: embed struct mtd_info within struct spi_nor")

I'm not 100% sure, but I thought I recall the -stable folks picking up
for-linus commits just based on the 'Fixes:' tags. I feel like that
isn't always ideal, though.

> > Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> 
> This may be worth taking as a fix for 4.4. However I'm not aware of
> any upstream driver failing to build because of this.

I don't see why it would need rushed out. All users of spi-nor.h
currently include mtd.h first. So there are no build failures because of
it.

Regards,
Brian
