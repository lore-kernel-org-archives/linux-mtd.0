Received: from mail.ku-gbr.de ([81.3.11.18] helo=ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ISVhc-0003y3-Oz
	for linux-mtd@lists.infradead.org; Tue, 04 Sep 2007 06:32:16 -0400
Received: from dslb-082-083-035-027.pools.arcor-ip.net ([82.83.35.27]:51710
	helo=localhost)
	by mail.ku-gbr.de with esmtpsa (Exim 4.50 #1 (Debian))
	id 1ISVlc-00032R-4S
	for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2007 12:36:20 +0200
Received: from anita ([10.10.0.18] helo=anita.doom)
	by localhost with esmtp (Exim 4.67) (envelope-from <lists@ku-gbr.de>)
	id 1ISVhU-0001zL-Fk
	for linux-mtd@lists.infradead.org; Tue, 04 Sep 2007 12:32:04 +0200
Received: from konsti by anita.doom with local (Exim 4.67)
	(envelope-from <lists@ku-gbr.de>) id 1ISVhU-0001CT-44
	for linux-mtd@lists.infradead.org; Tue, 04 Sep 2007 12:32:04 +0200
Date: Tue, 4 Sep 2007 12:32:04 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Subject: Re: Quad Die NAND Chip with 16Gb
Message-ID: <20070904103204.GA4599@anita.doom>
References: <20070831150443.GA10808@anita.doom>
	<20070831153132.GA27851@z1.synertronixx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070831153132.GA27851@z1.synertronixx>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2007-08-31 17:31 +0200 schrieb Konstantin Kletschke:

> Hardware feels well, so how does stupid konste merge these halfes?

Meanwhile I found the key in passing nr_chips via platform setup to our
device driver, do an nand_scan(mtd, 2) instead of nand_scan(mtd, 1) and
implement a reasonable select_chip() function.

That was all!

Kind regards, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
