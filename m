Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CisyC-0001TE-70
	for linux-mtd@lists.infradead.org; Mon, 27 Dec 2004 06:23:27 -0500
Message-Id: <6.0.1.1.0.20041227121334.01ec55d8@192.168.2.1>
Date: Mon, 27 Dec 2004 12:23:18 +0100
To: linux-mtd@lists.infradead.org
From: llandre <r&d2@dave-tech.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: How to exploit STS pin of Strata Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a question about STS pin of Strata Flash.
I'd like to implement a function in the low-level map driver
in order to exploit the STS pin to read the ready/busy
status (NAND-like).
How should I hack the code? It seems there is
no <board>_device_ready or something like that ...



TIA,

llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave-tech.it
email: r&d2@dave-tech.it
