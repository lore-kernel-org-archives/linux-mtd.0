Received: from moutvdom01.kundenserver.de ([195.20.224.200])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vF3t-0000Vz-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 10:06:13 +0100
Received: from [195.20.224.209] (helo=mrvdom02.schlund.de)
	by moutvdom01.kundenserver.de with esmtp (Exim 2.12 #2)
	id 14vF4K-0006vy-00
	for linux-mtd@lists.infradead.org; Thu, 3 May 2001 11:06:40 +0200
Received: from internet-gateway-x.zurich.ibm.com ([195.212.119.253] helo=psionic.de)
	by mrvdom02.schlund.de with esmtp (Exim 2.12 #2)
	id 14vF44-0008HW-00
	for linux-mtd@lists.infradead.org; Thu, 3 May 2001 11:06:24 +0200
Message-ID: <3AF11F5F.B56457D2@psionic.de>
Date: Thu, 03 May 2001 11:05:35 +0200
From: psionic@psionic.de
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org.
Subject: slram problems
Content-Type: text/plain; charset=us-ascii
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

Hi!

  I tried to get the slram-driver to work but I always get an

  ioremap failed.

  error. I specified a memory region (start + size) not available to the
  kernel (reduced using mem-bootparameter). Any hints what might be wrong?

Thx in advance!
  jochen
