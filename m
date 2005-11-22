Received: from web26306.mail.ukl.yahoo.com ([217.146.176.17])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeZtb-0000pR-7w
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 10:17:31 -0500
Message-ID: <20051122151042.57202.qmail@web26306.mail.ukl.yahoo.com>
Date: Tue, 22 Nov 2005 15:10:42 +0000 (GMT)
From: Sreecharan Sivadevuni <mailsreecharan@yahoo.co.uk>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Question regarding mounting CRAMFS and JFFS2 from a single flash
	chip on ucLinux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everybody !

I am using an arm processor based development board on
which there is an Intel E28F320(NOR) flash chip which
is of 4MB. This flash chip is linearly mapped to
physical address space at '0x00400000' going till
0x007FFFFF. On this flash I have placed files in the
following order:


1. booloader at 0x00400000
2. linuz(linux kernel) at 0x00410000  /* of size 700 K
*/
3. image_usr.cramfs(cramfs file system)  at 0x00500000
/* of size 1M */
4. image.cramfs (Another crmfs filesystem) at
0x00700000 /* 1M size */

Now I want to put a JFFS2 filesystem at the end of the
'image_usr.cramfs' file i.e at '0x006000000' or even
at 0x00500000 and push image.cramfs a little below.

For this I have configured my kernel to use MTD
drivers and enabled JFFS2 support. I able to see that
my flash is getting detected on 'cfi_probe'. But when
I am trying to mount JFFS2(or trying to write to )
'/dev/mtdblock0'(at 0x00600000) I am getting an error
that it is a readonly file system. The error as it is
printed on console is "-EROFS. Is the Sector Locked ?"
This is coming from file 'cfi_cmdset_0001.c' from
function 'do_erase_one_block'. This is despite that I
have made my JFFS2 partition as MTD_WRITEB_WRITEABLE
in 'physmem.c' file.

I would like to know if there is anything inherently
wrong with what I am trying, otherwise if somebody
could give me some clue about what must be going
wrong. by the way I am using uClinux-2.4.24. do I need
to upgrade my MTD drivers ?.

please cc your replies to my mail-id!

Thank you
Sreecharan.S



		
___________________________________________________________ 
WIN ONE OF THREE YAHOO! VESPAS - Enter now! - http://uk.cars.yahoo.com/features/competitions/vespa.html
