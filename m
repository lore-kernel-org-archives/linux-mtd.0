Received: from [195.206.0.182] (helo=server.tattile.local)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19c5dQ-00060v-7a
	for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2003 16:53:04 +0100
From: "Cristiano Parzani" <c.parzani@tattile.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 14 Jul 2003 17:53:14 +0200
Message-ID: <000001c34a20$09186b30$1d00a8c0@cristianop>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: FAT16 reserved sector determination
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi to all,

i have a nice question for anyone expert with FAT. I have bought a
Secure Digital and I want to write my own code for FAT16 on it. I have
reached to dump the SD boot sector and a particular thing I have
noticed:

number of reserved sector typically = 1 for FAT 16 is 8, and the SD was
formatted by Windows XP. This is very strange, I have read Windows white
paper on FAT and it tell that normally for FAT16 this value is 1. Have
anyone a response at this question, where can I search FAT code on Linux
that answer my question, I have already looked a bit into fat for linux
but I have found nothing.

 

TIA
