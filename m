Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoaZx-0006js-Vd
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 08:39:19 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HoaZp-0005tf-Er
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 09:39:09 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 May 2007 09:39:09 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 May 2007 09:39:09 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: [PATCH] Add support for SST 39VF6402B flash - block & sector
	support ?
Date: Thu, 17 May 2007 07:39:00 +0000 (UTC)
Message-ID: <loom.20070517T093705-724@post.gmane.org>
References: <200705161047.57549.florian.fainelli@int-evry.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Florian Fainelli <florian.fainelli <at> int-evry.fr> writes:

> Note that according to the datasheet this flash has two possible erase sizes : 
> 64kb and 4kb. I prefer using 64Kb erase size since we do not have to change 
> the erase command from 0x50 (64Kb) to 0x30 (4Kb).
> 

Or maybe the MTD model now needs to include support
for both 'block' and 'sector' erase ?

Regards,
MikeW
