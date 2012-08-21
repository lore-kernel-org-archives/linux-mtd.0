Received: from metis.ext.pengutronix.de ([92.198.50.35])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3kv2-0000yJ-QC
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 09:38:42 +0000
Date: Tue, 21 Aug 2012 11:35:18 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: another issue with ubifs on v3.6-rc2: attaching an formatted
 device
Message-ID: <20120821093518.GD12220@pengutronix.de>
References: <20120820160750.GS2232@pengutronix.de>
 <1345489867.1789.3.camel@kyv>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1345489867.1789.3.camel@kyv>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 20, 2012 at 10:11:07PM +0300, Artem Bityutskiy wrote:
> On Mon, 2012-08-20 at 18:07 +0200, Uwe Kleine-König wrote:
> > [  163.714143] uncorrectable error : 
> > [  163.727597] UBI warning: ubi_io_read: error -74 (ECC error) while
> > reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> > [  163.740737] uncorrectable error : 
> > [  163.744032] UBI warning: ubi_io_read: error -74 (ECC error) while
> > reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> > [  163.757119] uncorrectable error : 
> > [  163.760487] UBI warning: ubi_io_read: error -74 (ECC error) while
> > reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> > [  163.774427] uncorrectable error : 
> > [  163.777808] UBI error: ubi_io_read: error -74 (ECC error) while
> > reading 64 bytes from PEB 0:0, read 64 bytes 
> 
> This looks like your flash does not really support sub-pages while
> declares that it does. Check it with MTD subpage test.
the subpages test fails with:

[   82.435792] mtd_subpagetest: written up to eraseblock 7424
[   82.905775] mtd_subpagetest: written up to eraseblock 7680
[   83.375201] mtd_subpagetest: written up to eraseblock 7936
[   83.840447] mtd_subpagetest: written 8192 eraseblocks
[   83.845522] mtd_subpagetest: verifying all eraseblocks
[   83.852740] uncorrectable error : 
[   83.856086] mtd_subpagetest: error: read failed at 0x0
[   83.861469] mtd_subpagetest: error -74 occurred
[   83.866093] =================================================
Error: could not insert module ./drivers/mtd/tests/mtd_subpagetest.ko: Bad message

I don't have a clue yet how to debug that further. Will start with
checking older kernel releases. Any hints welcome.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
