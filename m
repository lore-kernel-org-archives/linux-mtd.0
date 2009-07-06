Received: from vega.surpasshosting.com ([72.29.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MNj1T-0008BZ-T7
	for linux-mtd@lists.infradead.org; Mon, 06 Jul 2009 07:54:15 +0000
Received: from bzq-79-179-18-235.red.bezeqint.net ([79.179.18.235]:50003
	helo=felix.lan) by vega.surpasshosting.com with esmtpa (Exim 4.69)
	(envelope-from <felix@embedded-sol.com>) id 1MNj1a-0005H1-HE
	for linux-mtd@lists.infradead.org; Mon, 06 Jul 2009 03:54:06 -0400
Message-ID: <4A51AD93.40903@embedded-sol.com>
Date: Mon, 06 Jul 2009 10:53:55 +0300
From: Felix Radensky <felix@embedded-sol.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Missing breaks in nand_scan_tail ?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

In function nand_scan_tail() in switch statement

switch (chip->ecc.mode) {

...

}

the final break is missing for NAND_ECC_HW and NAND_ECC_HW_SYNDROME cases.

Is this a bug or break is omitted intentionally ?

Thanks.

Felix.
