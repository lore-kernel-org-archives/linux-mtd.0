Received: from d12lmsgate.de.ibm.com ([195.212.91.199])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vFI0-0000YE-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 10:20:48 +0100
Received: from d12relay01.de.ibm.com (d12relay01.de.ibm.com [9.165.215.22])
	by d12lmsgate.de.ibm.com (1.0.0) with ESMTP id LAA118736
	for <linux-mtd@lists.infradead.org>; Thu, 3 May 2001 11:20:31 +0200
From: JSCHAEUB@de.ibm.com
Received: from d12mta11.de.ibm.com (d12mta11_cs0 [9.165.223.2])
	by d12relay01.de.ibm.com (8.8.8m3/NCO v4.96) with SMTP id LAA25158
	for <linux-mtd@lists.infradead.org>; Thu, 3 May 2001 11:19:44 +0200
To: linux-mtd@lists.infradead.org
Message-ID: <C1256A41.00333B6E.00@d12mta11.de.ibm.com>
Date: Thu, 3 May 2001 11:30:32 +0200
Subject: slram problems
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline
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


Hi!

  I tried to get the slram-driver to work but I always get an

  ioremap failed.

  error. I specified a memory region (start + size) not available to the
  kernel (reduced using mem-bootparameter). Any hints what might be wrong?

Thx in advance!
  jochen
