Received: from host28.istor.com ([66.134.214.28]
	helo=mail1irv.inside.istor.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkXVD-0006um-BX
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 20:20:04 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Jul 2004 17:19:46 -0700
Message-ID: <7D036BD3216A084DB1BD9D62BCEAF2905A203B@mail1irv.inside.istor.com>
From: "Sidney Chu" <schu@istor.com>
To: <linux-mtd@lists.infradead.org>
Subject: Atomic write with JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have several questions regarding the JFFS2 in my development
environment.
Would you please help me by answering the questions? Thanks in advance.
The development environment:
1. Use Toshiba NAND Flash. It has 512 bytes sector and 16 bytes header
   for each sector. The Erase Page contains 32 sectors. Hence the Erase
   Page is 16Kbytes (512x32) plus another 512 bytes header (16x32).
2. The JFFS2 page size is configured as 4Kbytes.
3. The JFFS2 compression is on.
4. I need atomic write to avoid the problems if there is not finished
   writing during power failure.

My questions are the following:
1. Does JFFS2 guarantee the atomic write on JFFS2 page size which is
   4Kbytes in my development environment?
2. If I have a 1Mbytes file, can JFFS2 guarantee the atomic write every
time
   when I only update partial part of the file? The partial update is
either
   within 4Kbytes or more than 4Kbytes. What happen if the partial
update
   crosses the JFFS2 page boundary?

Regards,
Sidney
