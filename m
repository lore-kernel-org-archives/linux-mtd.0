Received: from web58702.mail.re1.yahoo.com ([66.196.100.124])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HDv6N-0002fa-Lr
	for linux-mtd@lists.infradead.org; Sun, 04 Feb 2007 23:05:17 -0500
Date: Sun, 4 Feb 2007 19:58:29 -0800 (PST)
From: Philip Rakity <prakity@yahoo.com>
Subject: Do not understand use of oobfree
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <872380.68552.qm@web58702.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


When reading the documentation for nand flash I realized that there was
an out of band area of some size following each page.  This size could
be say 8, 16 or 64 bytes.  Inside this oob area is stored a bad block
marker.  There may also be stored ecc bytes.  And there is of course
some area not used.

Some Questions:

a) the location and size of the ecc bytes are determined by what ?
.useecc = MTD_NANDECC_AUTOPLACE,

the flash chip -
the nand controller on the flash chip ?
both ??  

b) the oobfree area is specified as a {offset, length) pair.  When this
gets to say the jffs2 file system what does it see.  For example
	.oobfree = { {8, 8} }

it would see 8 bytes starting at offset 8 OR 8 bytes starting at offset
0 and the mtd driver would do the mapping.

more complex example
	.oobfree = { {3, 2}, {6, 2} }

would jffs2 see 4 bytes at offset 0. or 2 sets of data at offset 3 and
offset 6.

I am asking because if I have a flash device that does not map per the
standard includes do I have to touch jffs2 to get things to work. 

regards,

Philip



 
____________________________________________________________________________________
Now that's room service!  Choose from over 150,000 hotels
in 45,000 destinations on Yahoo! Travel to find your fit.
http://farechase.yahoo.com/promo-generic-14795097
