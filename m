Received: from [210.123.115.185] (helo=mail.softman.co.kr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vT0d-0007VT-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2002 02:04:19 +0100
Received: from jni04 ([202.79.104.82])
	by mail.softman.co.kr (8.11.3/8.11.3) with SMTP id g3B11qZ32127
	for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2002 10:01:57 +0900
Message-ID: <003101c1e0f4$e18d2410$3501040a@jni04>
From: "Linus Kerk" <linus_kerk@linuxincluded.com>
To: <linux-mtd@lists.infradead.org>
Subject: odd byte write to a single 16-bit flash
Date: Thu, 11 Apr 2002 09:04:20 +0800
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

I'm designing a custom board with 1 X16bits NOR Flash. This chip have 1
write enables. So, my question is will JFFS handle writing to odd byte
location, by performing read-modify-write? Or do I have to use 2 X 8-bits
Flash so that I have 1 Write enable fro each byte.

Linus Kerk
