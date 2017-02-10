Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccFxB-0004GP-2g
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 18:29:56 +0000
Received: by mail-pf0-x243.google.com with SMTP id e4so3004175pfg.0
 for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2017 10:29:32 -0800 (PST)
Date: Fri, 10 Feb 2017 10:29:28 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at,
 "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
Subject: Re: [PATCH 1/1] mtd: spi-nor: remove WARN_ONCE() message in
 spi_nor_write()
Message-ID: <20170210182928.GA125303@google.com>
References: <0078578d0f5d2402ac623afabf601d25998f84a9.1481044434.git.cyrille.pitchen@atmel.com>
 <20161208163109.17429627@bbrezillon>
 <4ffbad4b-f1a5-a998-fe5b-f73b934435e4@wedev4u.fr>
 <20170209022347.GO94627@google.com>
 <4420829e-6d08-111f-685c-65ea7f2d215c@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4420829e-6d08-111f-685c-65ea7f2d215c@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 09, 2017 at 02:50:02PM +0100, Cyrille Pitchen wrote:
> In most, if not all, cases this warning is a false positive as for most
> memories it is valid to write a single page with more than one Page Program
> commands or to write data starting from the middle of the page.

Right, I agree that many cases were false positives, and the WARN is
rather scary, so it's definitely good to drop the WARN. And I've already
pulled that patch in, so we're good :)

> The only hardware limitation at the SPI NOR side is that we can't cross the
> page boundary.

Is it the *only* limitation? Marcin pointed out that at least for some
Macronix flash:

http://www.macronix.com/Lists/ApplicationNote/Attachments/1606/AN0302V1%20-%20MX25L_G%20Serial%20Flash%20Programming%20Guide.pdf

  "it is strongly recommended that data be written to the MX25L_G using
  full 256-byte pages"

.

Now I don't claim the original WARN captured this recommendation
correctly, but I was just nudging people to consider the original
intention.

> If we would do so, internally the SPI NOR memory would wrap
> the address instead of incrementing it hence the additional data would be
> written at the beginning of the same page and not at the beginning of the
> next one.

Brian
