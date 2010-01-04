Received: from [217.72.192.184] (helo=fmmailgate09.web.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NRiN8-0003hn-3U
	for linux-mtd@lists.infradead.org; Mon, 04 Jan 2010 08:33:10 +0000
Received: from web.de
	by fmmailgate09.web.de (Postfix) with SMTP id 6A0A42B48DBA
	for <linux-mtd@lists.infradead.org>;
	Mon,  4 Jan 2010 09:31:57 +0100 (CET)
Date: Mon, 04 Jan 2010 09:31:55 +0100
Message-Id: <1123501046@web.de>
MIME-Version: 1.0
From: Arno Steffen <arno.steffen@web.de>
To: linux-mtd@lists.infradead.org
Subject: Empty flash at ... / check_node_data: wrong data CRC 
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I do have a system which is not used with a controlled shutdown, but
with a cold heartless poweroff only.

I am using a jffs2 filesystem as it should be journalling and robust
agains power loss.

But while boot I get  messages like:

Empty flash at 0x00963864 ends at 0x00964000

And after finishing boot:

[root@EEE ]# JFFS2 notice: (181) check=5Fnode=5Fdata: wrong data CRC in
data node at 0x01f8b55c: read 0xa7496669, calculated 0x5aea21d5.
JFFS2 notice: (181) check=5Fnode=5Fdata: wrong data CRC in data node at
0x01f88d3c: read 0xc5d341c, calculated 0x3f0d9534.

This sound seroius to me. How to prevent this if I can't use "halt" or
other controlled shutdown=3F=20
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
GRATIS f=FCr alle WEB.DE-Nutzer: Die maxdome Movie-FLAT!
Jetzt freischalten unter http://movieflat.web.de
