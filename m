Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Wdjf-0004CT-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Jul 2002 15:00:28 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Can't format my DOC
Date: Mon, 22 Jul 2002 09:59:46 -0400
References: <1026923208.17761.22.camel@pc11>
In-Reply-To: <1026923208.17761.22.camel@pc11>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jens Nixdorf <jens.nixdorf@embesso.com>
Message-Id: <200207220956781.SM02488@there>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Jens,

You might want to try reformatting your DoC with an earlier version (4.2) of 
the M-Sys DFORMAT utility.  I believe this is still available at the M-Sys 
website.  This should take care of the "UnitSizeFactor" problem, which has 
not been completely resolved yet, as far as I know.

David -- is there anything I can do to help resolve this issue?  Has it 
already been addressed in the latest CVS code?

Regards,

Mark

Jens Nixdorf wrote:
> DiskOnChip 2000 found at address 0xD8000
> Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba
> TC58256FT/DC)
> 9 flash chips found. Total DiskOnChip size: 288 MiB
> mtd: Giving out device 0 to DiskOnChip 2000
> ...
> Sorry, we don't support UnitSizeFactor of != 1 yet.
> Could not find valid boot record
> Could not mount NFTL device
