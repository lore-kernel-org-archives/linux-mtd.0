Received: from mail.uat.com.tw ([211.22.69.150] helo=uat.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15vcdL-0007px-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2001 11:48:40 +0100
Received: from changyj ([192.168.0.236])
	by uat.com.tw (8.9.3/8.9.3) with SMTP id SAA10829
	for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2001 18:57:42 +0800 (CST)
Message-ID: <005d01c15ae9$099dc960$0205a8c0@uat.com.tw>
From: =?big5?B?sWmm9qX0KFlvdS1KZW4gQ2hhbmcp?= <changyj@uat.com.tw>
To: <linux-mtd@lists.infradead.org>
Subject: Does DiskonChip work on IDT RC32334 CPU(MIPS)?
Date: Mon, 22 Oct 2001 19:02:00 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
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

Dear all:

My embedded linux system is MIPS(IDT RC32334 RISC CPU).
The BIOS can detect DiskOnChip at 0xB2000000 address.

How do I setup the physical address of DiskOnChip for 
Memory Technology Device Subsystem in Linux ? 
Is the address same as 0xB2000000?
 
You-Jen Chang
Software Engineer
Software Dept.
UAT
TEL:886-2-87978488 ext:638
Email: changyj@uat.com.tw
