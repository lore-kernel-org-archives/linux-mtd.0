Received: from web13905.mail.yahoo.com ([216.136.175.68])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19BfqE-0002Hv-6J
	for <linux-mtd@lists.infradead.org>; Fri, 02 May 2003 20:05:06 +0100
Message-ID: <20030502190516.98480.qmail@web13905.mail.yahoo.com>
Date: Fri, 2 May 2003 12:05:16 -0700 (PDT)
From: Michael Moedt <xemc@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Building MTD utils w/ arm-linux- cross
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

I ran into a little bit of trouble compiling the MTD
utilities for an ARM-based system.  I'm using
2.4.19-rmk7 for an EP7312.  I executed the
'patchin.sh' to this kernel directory, and copied the
'util' directory over.  It compiles fine for the host
system (x86), but when I uncommented the
"CROSS=arm-linux-", it didn't compile correctly.

Anyways, the trouble was in the form of:

-----
arm-linux-gcc -I../include -O2 -Wall
-Wstrict-prototypes -Wshadow   -c -o eraseall.o
eraseall.c
eraseall.c:40: zlib.h: No such file or directory
make: *** [eraseall.o] Error 1
mmoedt@reptar:~/gonzo/linux-2.4.19-rmk7/util$
-----

Well, I installed zlib-1.1.4 into
/usr/local/arm/2.95.3 , but I needed to add -I and -L
flags to the Makefile in order for it to find it.  It
seems to work, but I didn't find this anywhere when I
searched the mailing list.  Is this the standard
procedure, or am I doing something wrong?

Anyways, I also wanted to let someone with CVS access
know that there's a typo in the Makefile.  In
eraseall's build rule, it uses $(LDLAGS) instead of
$(LDFLAGS).  I guess no one needs to add the '-L'
LDFLAG other than me?

Mike



__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
