Received: from mail.valcom.com ([151.199.82.35])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HI2LN-0004EN-Ge
	for linux-mtd@lists.infradead.org; Fri, 16 Feb 2007 07:37:44 -0500
Message-ID: <45D5A58C.3070304@valcom.com>
Date: Fri, 16 Feb 2007 07:37:32 -0500
From: Glen Johnson <gjohnson@valcom.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Linux fs/JFFS2 question.
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linux-mtd,
I need some help understanding some code under linux-2.6.x/fs/jffs2. 
After trying to mount a JFFS2 file system, by typing mount mtd:JFFS2
/mnt, without success.  I did some digging in the code, and I found if I
change a line in  linux-2.6.x/fs/jffs2/scan.c mount works!  Listed below
is the one change I made in function jffs2_scan_medium().

 if (!ret && pointlen < c->mtd->size) {      OLD code

 if (!ret && pointlen <= c->mtd->size) {    NEW code


Later in the function the side effect of this if() statement is an
altered value for buf_size, not 0.  This value is then passed to the
function jffs2_scan_eraseblock() where buf_size is tested.  Here is
where my understanding of things falls apart. 

if (!buf_size) {
           /* Do stuff, but do NOT read anything from the flash. */
           ...
} else {
          ...
          jffs2_fill_scan_buf( ...);
}

It appears to me if buf_size is prevented from being set back in
jffs2_scan_medium() then an actual read from the flash does occur, which
allows mount to read valid data and have success.  Otherwise there
appears to me that the read never made, creating a guaranteed failure every time.
Why is this the case? 
I can't find where or how the driver ever reads real data otherwise. 
Help me see the bigger picture here. 
I first sent this to uClinux-devel mailing list so I provided the following info to help describe the context in which I am working.  
uClinux source: uClinux-dist-20060803
tool chain:  m68k-uclinux-tools-20060615.sh
processor: COLDFIRE M5272

Looking forward to being enlightened,
Glen Johnson
