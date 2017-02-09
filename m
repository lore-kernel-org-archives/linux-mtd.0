Received: from mail-pg0-f67.google.com ([74.125.83.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbeQ3-0007UT-4O
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 02:25:13 +0000
Received: by mail-pg0-f67.google.com with SMTP id 75so16436836pgf.3
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 18:24:50 -0800 (PST)
Date: Wed, 8 Feb 2017 18:23:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, richard@nod.at
Subject: Re: [PATCH 1/1] mtd: spi-nor: remove WARN_ONCE() message in
 spi_nor_write()
Message-ID: <20170209022347.GO94627@google.com>
References: <0078578d0f5d2402ac623afabf601d25998f84a9.1481044434.git.cyrille.pitchen@atmel.com>
 <20161208163109.17429627@bbrezillon>
 <4ffbad4b-f1a5-a998-fe5b-f73b934435e4@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ffbad4b-f1a5-a998-fe5b-f73b934435e4@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 13, 2016 at 05:43:52PM +0100, Cyrille Pitchen wrote:
> Le 08/12/2016 à 16:31, Boris Brezillon a écrit :
> > On Tue, 6 Dec 2016 18:14:24 +0100
> > Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
> > 
> >> This patch removes the WARN_ONCE() test in spi_nor_write().
> >> This macro triggers the display of a warning message almost every time we
> >> use a UBI file-system because a write operation is performed at offset 64,
> >> which is in the middle of the SPI NOR memory page. This is a valid
> >> operation for ubifs.
> >>
> >> Hence this warning is pretty annoying and useless so we just remove it.
> >>
> >> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> >> Suggested-by: Richard Weinberger <richard@nod.at>
> >> Suggested-by: Andras Szemzo <szemzo.andras@gmail.com>
> > 
> > Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > 
> Applied to git://github.com/spi-nor/linux.git

Do you have any idea on how to handle or communicate this better? I
recall Michal added this because he was adding new write looping that
didn't previously exist; we might create partial-page writes because his
SPI controller was too dumb to make larger ones.

Anyway, since this is hitting real (and more or less false positive)
use cases, then this patch is probably good.

Brian
