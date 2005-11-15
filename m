Received: from smtprelay02.ispgateway.de ([80.67.18.14])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eby2f-00015D-DM
	for linux-mtd@lists.infradead.org; Tue, 15 Nov 2005 05:28:01 -0500
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.112.74])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay02.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 15 Nov 2005 10:27:35 -0000
Received: from [192.168.0.63] (unknown [192.168.0.63])
	by deepspace9.in2soft.meep (Postfix) with ESMTP id E896F6C75
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Nov 2005 11:26:29 +0100 (CET)
Message-ID: <4379B814.3010407@gmail.com>
Date: Tue, 15 Nov 2005 11:27:32 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Strange NOR read/write throughput behaviour
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

can anybody help me explaining this diagram of NOR read throughput?

	http://files.lamark.de/nor_read.png

As soon as a file, read from a StrataFlash containing only this file,
exceeds erase block size (128KiB), file reading lasts a portion of time
longer and read throughput stagnates...

Write throughput seems to be constant around erase block size:

	http://files.lamark.de/nor_write.png

Best regards,
Bernhard
