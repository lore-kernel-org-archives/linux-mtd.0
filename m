Received: from transedge-153-132.transedge.com ([216.171.153.132] helo=mercury.steinkuehler.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16PB3f-0007ta-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2002 23:26:00 +0000
Received: from csteinathlon (transedge-153-131.transedge.com [216.171.153.131])
	by mercury.steinkuehler.net (8.9.3/8.9.3) with SMTP id VAA11008
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2002 21:21:16 -0600
Message-ID: <179401c19af8$a0418560$4101220a@csteinathlon>
From: "Charles Steinkuehler" <charles@steinkuehler.net>
To: <linux-mtd@lists.infradead.org>
References: <E16MWkI-0003Z1-00@pentafluge.infradead.org> <20020104085040.A48397@idiom.com>
Subject: Atmel Flash
Date: Fri, 11 Jan 2002 17:35:16 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Are the small-sector Atmel flash (ie 29C010/29C040) parts supported by MTD?

These are the parts with 128/256 Byte sector size (ie 1024 128 byte sectors
in the '010, and 2048 256 byte sectors in the '040), with no explicit erase
command required before writing new data.

Charles Steinkuehler
charles@steinkuehler.net
