Received: from relay4.clb.oleane.net ([213.56.31.24])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uSxr-0005DV-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2002 08:21:35 +0100
Received: from dg ([217.167.163.86])
	by relay4.clb.oleane.net with ESMTP id g8Q7L3Nr023899
	for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2002 09:21:04 +0200
From: "free" <dag4004@free.fr>
To: "MTD mailing liste" <linux-mtd@lists.infradead.org>
Subject: [newbie] MTD and tiny RAM
Date: Thu, 26 Sep 2002 09:25:41 +0200
Message-ID: <BNEJIGKFJNJLELKBCMDAMEJGCCAA.dag4004@free.fr>
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

Hello,

I use a very tiny SRAM (128ko) battery backuped to save
very important and changeable data.
I have a char. driver for it (i know how to read/write it)
I would like to mount it on Linux VFS but it seems that
bloc drivers are RAM cached.
Acces on this SRAM must be immediatly apply (if power goes
down data must be safe)

Does MTD could help me :
- is my SRAM not to tiny (128KO) for use with MTD ?
- could i acces to my SRAM through MTD in block mode without caching ?
- what king of file system could fit on such tiny RAM ?


All advices are welcome.

Thanks

Damien
