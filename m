Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nFjf-0006Jf-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 10:49:07 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Henrik Nordstrom <hno@marasystems.com>
To: Russ Dill <Russ.Dill@asu.edu>, mateo@posta.star.si
Subject: Re: DOC 2000 and GRUB
Date: Fri, 6 Sep 2002 11:49:02 +0200
Cc: linux-mtd@lists.infradead.org
References: <20020906060115.6A1663946@sitemail.everyone.net> <1031302476.763.2.camel@russ>
In-Reply-To: <1031302476.763.2.camel@russ>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200209061149.02058.hno@marasystems.com>
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

Russ Dill wrote:

> k, the grub firmware takes up a specific amount of space, if you just
> load the grub firmware without thinking about this, you'll likely
> overwrite important parts of your nftl partition. So you need to figure
> out how many sectors your firmware takes up, nftl_format just past that,
> erase the now unused sectors, and then load your firmware

Or wait until the new NFTL format is understood, and use the M-Sys DFORMAT 5.x 
program format the flash and install GRUB (plus reserve additional binary 
boot partition space if needed for future upgrades of GRUB)

Personally I am not very comfortable with using ntfl_format when even the 
documentation to ntfl_format says you really should be using the DFORMAT tool 
for formatting the flash.

Regards
Henrik
