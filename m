Received: from bay0-omc2-s26.bay0.hotmail.com ([65.54.246.162])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GFxE1-0003wF-7T
	for linux-mtd@lists.infradead.org; Wed, 23 Aug 2006 19:13:15 +0100
Message-ID: <BAY110-F48855559EABB206C5E9E4BC470@phx.gbl>
From: "Han Chang" <posaune@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: Issue with h/w ecc based NAND driver.
Date: Wed, 23 Aug 2006 11:12:31 -0700
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I'm using a NAND with h/w ecc. When a block is erased, both main data and 
oob are set to 0xff, and if the driver read the main data in the page with 
hardware enabled ecc, the 0xff in the oob is not the right ecc code, so the 
ecc mechanism in the h/w try to recover the error and trash the content in 
the main data area.

I tried to set the right ecc code in the oob for every page whenever a block 
is erased. But then the problem is with page programming. When write a page, 
the h/w ecc controller generates the ecc code and write it to the oob, since 
the oob is already written once during erase, the 2nd write to the oob is 
not taken well. So when read back the same page, it causes ecc error again.

I would appreciate very much if someone can shed some light on this kind of 
delimma.

Thanks,
Han
