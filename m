Received: from mailc.telia.com ([194.22.190.4])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aMbE-0001qg-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 21:31:08 +0100
Received: from d1o899.telia.com (d1o899.telia.com [213.67.176.241])
	by mailc.telia.com (8.12.5/8.12.5) with ESMTP id g71KV7Lr001016
	for <linux-mtd@lists.infradead.org>; Thu, 1 Aug 2002 22:31:07 +0200 (CEST)
Received: from jocke (h163n2fls32o899.telia.com [217.209.73.163])
	by d1o899.telia.com (8.10.2/8.10.1) with SMTP id g71KV6V01623
	for <linux-mtd@lists.infradead.org>; Thu, 1 Aug 2002 22:31:06 +0200 (CEST)
Message-ID: <003d01c2399a$b519a9e0$0200a8c0@telia.com>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
References: <FA06AA2C99BCD511951200005A99441001E3ECD8@irvexch1.sextantifs.com>
Subject: write suspend and/or erase suspend
Date: Thu, 1 Aug 2002 22:33:34 +0200
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

When a erase or write is suspened to allow some other part of the FS to read, is that read
garanted to read from another sector than the one that has been suspended?

I am asking since I think it's not allowed to access the sector that has a 
suspended operation. I am using Intel Strata Flash.

   Jocke
