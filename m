Received: from mailout.despammed.com ([65.112.71.29])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKfye-0001EN-Az
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 12:39:49 -0400
Received: from filter.despammed.com (filter.despammed.com [65.112.71.26])
	by mailout.despammed.com (8.11.6+Sun/8.11.6) with SMTP id i9LGOGk29291
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2004 11:24:17 -0500 (CDT)
Date: Thu, 21 Oct 2004 11:24:17 -0500 (CDT)
Message-Id: <200410211624.i9LGOGk29291@mailout.despammed.com>
From: bodhi@despammed.com
To: linux-mtd@lists.infradead.org
Subject: Howto write to flash from user space (II)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I already read http://www.linux-mtd.infradead.org/
but I found no useful informations
How can I write directly into flash from an user space application ?
I am using a SA1110 with 16MB StrataFlash.
I tried using /dev/mem but I can only read and not write to flash.
I do not have any /dev/mtd* device in my /dev , why ?
Do I need to develop a driver ?
Please help me, with at least a useful link or better a sample.
TIA

(sorry for the broken thread, I've lost the original message)
