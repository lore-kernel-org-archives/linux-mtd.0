Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDlh7-0001aH-23
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 20:43:55 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MDlh3-00014M-I2
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 20:43:45 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2009 20:43:45 +0000
Received: from jehan by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2009 20:43:45 +0000
To: linux-mtd@lists.infradead.org
From: Jehan Bing <jehan@orb.com>
Subject: Re: Nandwrite's behavior in case of write failure
Date: Mon, 08 Jun 2009 13:43:26 -0700
Message-ID: <4A2D77EE.2090400@orb.com>
References: <h09s2s$ar6$1@ger.gmane.org>	<1244205087.5847.66.camel@localhost.localdomain>	<4A29D723.1010109@gmail.com>
	<1244365076.5847.317.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
In-Reply-To: <1244365076.5847.317.camel@localhost.localdomain>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> Yes, write and erase failure mean that the erasblock is bad. But I think
> marking a block as bad straight away is just dangerous. Who knows may be
> this is a small glitch in a bus, or a software bug, or some-one
> corrupted driver's memory, or whatever. This is why UBI is doing
> eraseblock torturing before marking it as bad. And it is very careful
> about error codes - only EIO code is considered as a reason to mark an
> eraseblock as bad.


Fixed broken behavior in case of write failure. More specifically:
- Only try to mark a block bad if the errors are EIO. Other errors
will abort the tool.
- Also abort the tool if the marking fails instead of ignoring it.

Signed-off-by: Jehan Bing <jehan@orb.com>

--- a/nandwrite.c	2009-06-08 13:31:14.000000000 -0700
+++ b/nandwrite.c	2009-06-08 13:33:32.000000000 -0700
@@ -586,6 +586,10 @@ int main(int argc, char * const argv[])
 			erase_info_t erase;
 
 			perror ("pwrite");
+			if (errno != EIO) {
+				goto closeall;
+			}
+
 			/* Must rewind to blockstart if we can */
 			rewind_blocks = (mtdoffset - blockstart) / meminfo.writesize; /* Not including the one we just attempted */
 			rewind_bytes = (rewind_blocks * meminfo.writesize) + readlen;
@@ -602,7 +606,9 @@ int main(int argc, char * const argv[])
 				(long)erase.start, (long)erase.start+erase.length-1);
 			if (ioctl(fd, MEMERASE, &erase) != 0) {
 				perror("MEMERASE");
-				goto closeall;
+				if (errno != EIO) {
+					goto closeall;
+				}
 			}
 
 			if (markbad) {
@@ -610,7 +616,7 @@ int main(int argc, char * const argv[])
 				fprintf(stderr, "Marking block at %08lx bad\n", (long)bad_addr);
 				if (ioctl(fd, MEMSETBADBLOCK, &bad_addr)) {
 					perror("MEMSETBADBLOCK");
-					/* But continue anyway */
+					goto closeall;
 				}
 			}
 			mtdoffset = blockstart + meminfo.erasesize;
