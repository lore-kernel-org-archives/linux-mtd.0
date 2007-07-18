Received: from web30213.mail.mud.yahoo.com ([209.191.69.60])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IBEdY-0001Uc-H1
	for linux-mtd@lists.infradead.org; Wed, 18 Jul 2007 14:52:38 -0400
Date: Wed, 18 Jul 2007 11:45:54 -0700 (PDT)
From: Siddharth Choudhuri <siddh_c@yahoo.com>
Subject: [RFC] sysfs support for mtd
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <470958.35224.qm@web30213.mail.mud.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have added a sysfs support for mtd. There was an
earlier discussion some time back
(http://lists.infradead.org/pipermail/linux-mtd/2006-December/016952.html)
about adding sysfs support for mtd.

Here's the design:
o Each mtd partition appears as a directory under 
/sys/devices/mtd/ 
o The following fields from struct mtd_info are
exported as files - eccsize, ecctype, erasesize,
numeraseregions, oobsize, size, type, writesize. 

--------------
Eg: 
# ls -l /sys/devices/mtd
drwxr-xr-x    2 root     root            0 Jan  1
00:00 mtd0
drwxr-xr-x    2 root     root            0 Jan  1
00:00 mtd1
drwxr-xr-x    2 root     root            0 Jan  1
00:00 mtd2
drwxr-xr-x    2 root     root            0 Jan  1
00:00 mtd3
# ls -l /sys/devices/mtd/mtd0/
-r--r--r--    1 root     root         4096 Jan  1
00:00 bbt
-r--r--r--    1 root     root         4096 Jan  1
00:00 eccsize
-r--r--r--    1 root     root         4096 Jan  1
00:00 ecctype
-r--r--r--    1 root     root         4096 Jan  1
00:00 erasesize
-r--r--r--    1 root     root         4096 Jan  1
00:00 numeraseregions
-r--r--r--    1 root     root         4096 Jan  1
00:00 oobsize
-r--r--r--    1 root     root         4096 Jan  1
00:00 size
-r--r--r--    1 root     root         4096 Jan  1
00:00 type
-r--r--r--    1 root     root         4096 Jan  1
00:00  writesize
# cat /sys/devices/mtd/mtd0/oobsize 
64
-----------

I would like to get some suggestions from the group
before sending out a patch:
o Currently the fields type, ecctype are integers.
Should these be converted into appropriate strings as
per #defines from mtd-abi.h
Eg: cat /sys/devices/mtd/mtd0/type 
shows 4. Should this show MTD_NANDFLASH instead ? 

o I am not sure where an additional link from bus to
mtd should be added in the sysfs hierarchy. Should it
be /sys/bus/platform/devices -> ../../../devices/mtd
-OR-
/sys/bus/platform/ -> ../../devices/mtd 

o Any other comments/suggestions. 

thanks,
-sid












       
____________________________________________________________________________________
Get the Yahoo! toolbar and be alerted to new email wherever you're surfing.
http://new.toolbar.yahoo.com/toolbar/features/mail/index.php
