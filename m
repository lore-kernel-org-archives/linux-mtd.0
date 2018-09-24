Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4MnO-0002ce-0q
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2018 09:06:46 +0000
Date: Mon, 24 Sep 2018 11:04:33 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, Chris Packham
 <chris.packham@alliedtelesis.co.nz>
Subject: Re: Trouble with new marvell_nand driver on PXA3xx
Message-ID: <20180924110433.2cd5fb3a@bbrezillon>
In-Reply-To: <0e773d54-a2c2-63be-12e3-5da6caabd215@zonque.org>
References: <f3cf564d-7976-5b2e-ca07-ea872c165396@zonque.org>
 <20180924100902.7b177324@bbrezillon>
 <0e773d54-a2c2-63be-12e3-5da6caabd215@zonque.org>
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

On Mon, 24 Sep 2018 10:30:47 +0200
Daniel Mack <daniel@zonque.org> wrote:

> >> Interestingly, I can't seem to reproduce the bug with any of the mtd
> >> kernel tests, I've tried all of them, several times, and all succeed. So
> >> a file system test that includes the UBI/UBIFS layers seems to trigger
> >> different things in the driver than the the tests that operate on the
> >> mtd device directly.  
> > 
> > Looking at the backtrace, it seems to fail on a high PEB num. Are you
> > interfacing with a dual-die chip? Can you share the part number of your
> > chip?  
> 
> The chip is a NAND01GR3B2BZA which is identified like this during probe:

Okay, so it's definitely not caused by a missing R/B pin on a multi-die
chip (this chip only has one die).
