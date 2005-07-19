Received: from smtp9.wanadoo.fr ([193.252.22.22])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DurJx-0008Fm-I9
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 08:35:49 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0907.wanadoo.fr (SMTP Server) with ESMTP id 5CF561C00179
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 14:35:31 +0200 (CEST)
Received: from [192.168.123.151] (ATuileries-111-1-1-141.w80-11.abo.wanadoo.fr
	[80.11.62.141])
	by mwinf0907.wanadoo.fr (SMTP Server) with ESMTP id 227931C00163
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 14:35:31 +0200 (CEST)
From: Jean-Philippe Francois <jp.francois@cynove.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1121776529.2565.34.camel@fedorabox>
Mime-Version: 1.0
Date: Tue, 19 Jul 2005 14:35:29 +0200
Content-Transfer-Encoding: 7bit
Subject: Understanding jffs2 warning message
Reply-To: jp.francois@cynove.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am doing some test on a JFFS2 file system.
It is installed on a Macronix Flash 29LV320, with top boot block.
The part are cfi probed, and it works (almost) fine.

I am doing some tar/untar loop [1]. Every six or seven loop, I have a
serie of 8 warning messages :

Node totlen on flash (0xffffffff) != totlen in node ref (0x00001040)
Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
Node totlen on flash (0xffffffff) != totlen in node ref (0x00001044)
Node totlen on flash (0xffffffff) != totlen in node ref (0x00000768)

I looked at the code, but I don't understand what is the meaning of
these messages.
Do you think it can be related to the Top Boot Block layout of this
flash (ie last 64 k sector is replaced by 8 8k sector) ?
I might be wrong, but I think the sector layout and erase size is taken
into account by CFI probing ?

Regards,

JP Francois

[1] : tar/untar loop

#!/bin/sh
i=0
while [ true ]
do
        tar -xzf /test.tar.gz
        rm /test.tar.gz
        sync
	echo "pass $i"
        md5sum /usr/test/etc/rc3
        tar -czf /test.tar.gz /usr/test/
        rm -r /usr/test/
        sync
        let i=i+1
done
