Received: from mailout.despammed.com ([65.112.71.29])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKfIA-0000LX-4E
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 11:55:55 -0400
Received: from filter.despammed.com (filter.despammed.com [65.112.71.26])
	by mailout.despammed.com (8.11.6+Sun/8.11.6) with SMTP id i9LFeGk27157
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2004 10:40:16 -0500 (CDT)
Date: Thu, 21 Oct 2004 10:40:16 -0500 (CDT)
Message-Id: <200410211540.i9LFeGk27157@mailout.despammed.com>
From: bodhi@despammed.com
To: linux-mtd@lists.infradead.org
Subject: Howto write to faslh from user space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
this should be a FAQ, but I haven't been able to find the answer to this question in the Mailing Lists or Google.

Question:
How can I write directly into flash from an user space application ?
I am using a SA1110 with 16MB StrataFlash.
I tried using /dev/mem but I can only read and not write to flash.
Do I need to develop a driver ?

Please help me
TIA
