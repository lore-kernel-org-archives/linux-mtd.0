Received: from mailout01.ims-firmen.de ([213.174.32.96])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CpWoM-0003Dd-IV
	for linux-mtd@lists.infradead.org; Fri, 14 Jan 2005 14:08:44 -0500
Received: from scanner01.ims-firmen.de ([192.168.1.17])
	by mailout01.ims-firmen.de with esmtp (Exim 4.30) id 1CpWoC-0000UN-Ov
	for linux-mtd@lists.infradead.org; Fri, 14 Jan 2005 20:08:32 +0100
Received: from [80.133.242.227] (helo=susemail.lightmaze.com)
	by scanner01.ims-firmen.de with asmtp (Exim 4.30) id 1CpWoC-0005I2-Eu
	for linux-mtd@lists.infradead.org; Fri, 14 Jan 2005 20:08:32 +0100
Received: from LIMZKarrer (unknown [192.168.1.181])
	by susemail.lightmaze.com (Postfix SuSE 2.0) with SMTP id D09589B522
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Jan 2005 20:08:31 +0100 (CET)
From: "Jochen Karrer" <j.karrer@lightmaze.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 14 Jan 2005 20:08:30 +0100
Message-ID: <MKELJOLMMOHJCMIPKLJKAEBJCBAA.j.karrer@lightmaze.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: mysqld on jffs2: MyISAM Index write is slow
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am using mysqld on jffs2. Tables work fine, but as soon as
i am using indexes the writing of new entries becomes very slow.
I found that mysql is writing one 1024 byte block to the index file
of the MyISAM table (.MYI) for every new row. This is up to 20 times in
sequence
the same block. On non synchronous filesystems
this goes to a Buffer in RAM, but on jffs2 this causes many writes to
the flash. In my amdflash emulator I found that mysql writes about 180MB to
the flash
for a table of 13MB with 88000 rows.

Is there a way to make jffs2 a little bit asynchronous ? Or does anybody
know
how to tell mysqld to write smaller blocks ? Mounting a reiser as loopback
from
a file on jffs2 does not work because jffs2 doesn't support mmap.

Jochen
