Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17pXmM-0006aE-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Sep 2002 18:29:22 +0100
Message-ID: <2702075D4DE2B043BF5EB82E9CFAD45B0BD3B2@mail1.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "David Woodhouse (E-mail)" <dwmw2@infradead.org>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: jffs2_scan_eraseblock() errors - truly harmless?
Date: Thu, 12 Sep 2002 13:29:09 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hi,

I got a problem similar to the one discussed in the thread
"jffs2_scan_eraseblock() - errors in July 2002".  It first happened =
when I
rebooted my machine (with the reboot command) right after I copied a =
file
into my JFFS2 partition, and then when I mount the file system I get =
error
messages like these:

jffs2_scan_eraseblock(): Node at 0x0009d3f0 {0x1985, 0xffff, =
0x1985c002) has
invalid CRC 0x00001024 (calculated 0x7861f409)
jffs2_scan_inode_node(): Data CRC failed on node at 0x0009f45c: Read
0x3d13f217, calculated 0x96196114
jffs2_scan_inode_node(): Data CRC failed on node at 0x0038101c: Read
0x71f9e2ad, calculated 0x98bc2d06

In the discussion thread mentionned above, you said that this problem =
is
harmless.  If the node with bad CRC was written in part only by the =
garbage
collector which was potentially moving the original node when the =
reboot
occured, the original node is still there and  valid, so in that way =
this is
harmless.

But since the error message does apparently not disappear easily, what =
about
the space used by the node with the bad CRC?  I looked at the code and =
at
mount time it is added to the dirty space, but it is not marked as =
obsolete
on the medium...  thus the gc will not collect it.  In a system where =
power
fail would be frequent so this problem would have higher possibility to
occur, then a lot of flash space could be wasted. In that way, it is
harmless.

You also mentionned than in old JFFS2 code those nodes with bad CRC are
marked as obsolete when discovered at mount time, but where is this
happening?  I loooked at old code ( as per 2.4.19-pre7 ) and the
jffs2_scan_eraseblock() function does not seem to obsolete the nodes
obsolete itself. Where is this obsoleting done?

I am using CVS code as per July 3rd.  I know that more recent code =
should
not complain with such messages at mount time, but unless absolutely
necessary I'd rather not upgrade right now.  If I am right when I say =
that
the GC will not collect the bad CRC node, how could I patch the code
(without side effects!) to obsolete the bad crc nodes?

Thanks,

Fr=E9d=E9ric Giasson
