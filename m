Received: from mgw-x4.nokia.com ([131.228.20.27])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19HdhO-0003dm-8J
	for <linux-mtd@lists.infradead.org>; Mon, 19 May 2003 07:00:38 +0100
Received: from esvir04nok.ntc.nokia.com (esvir04nokt.ntc.nokia.com
	[172.21.143.36])h4J60uD15441	for <linux-mtd@lists.infradead.org>;
	Mon, 19 May 2003 09:00:56 +0300 (EET DST)
Received: from esebh001.NOE.Nokia.com (unverified) by esvir04nok.ntc.nokia.com
	<T624c0f281dac158f24078@esvir04nok.ntc.nokia.com> for
	<linux-mtd@lists.infradead.org>; Mon, 19 May 2003 09:00:56 +0300
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 19 May 2003 14:00:24 +0800
Message-ID: <AEB09EDA2548094C81ED6AA93269F63D01D09249@siebe001.apac.nokia.com>
From: <Srinivasu.Vaduguri@nokia.com>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: page aligned writes in NAND driver causes problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have code CVS checked out on May 7th. I have seen that all the nand =
writes are page aligned. If not they return error.

when I used this code I am finding the following errors if i write a =
file onto my JFFS partition.=20

Anyone has any clue..


thanx
Srini


Trace :

jffs2_flash_writev(): Non-contiguous write to 000741e8
 wbuf was previously 00074000-00074200
 kernel BUG at wbuf.c:297!
 jffs2_flush_wbuf(): Write failed with -5
 Write of %zd bytes at 0x00000044 failed. returned 475624, retlen %zd
 Not marking the space at 0x000741e8 as dirty because the flash driver
 returned retlen zero
