Received: from [210.17.210.210] (helo=mail.avantwave.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CNTnD-0003e9-G9
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2004 06:15:37 -0400
Received: from [172.16.10.215] (chung.avantwave.com [172.16.10.215])
	by mail.avantwave.com (8.12.10/8.12.10) with ESMTP id i9TAC44r001577
	for <linux-mtd@lists.infradead.org>; Fri, 29 Oct 2004 18:12:04 +0800
Message-ID: <41821A4D.3060701@avantwave.com>
Date: Fri, 29 Oct 2004 18:24:13 +0800
From: mike <mikelee@avantwave.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Access mtdblock from a driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all

    Could i access a mtdblock from a device driver? Or MTD provide me 
another interface for driver to access?

    Actually, i am under a situation that i have a development board 
with usb client, also it provide me a USB ram disk driver.
    I want to change it to be MTD access instead of sdram. I just can 
figure out two method, 1) USB ram disk driver access MTD function , 2) 
New Application program to act as the middle tier.

    please fix me if i am wrong

    Thanks for helping

Mike,Lee
