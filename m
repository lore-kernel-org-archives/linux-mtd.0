Received: from smtp-1.hut.fi ([130.233.228.91] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175Mqx-0005l8-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 09:31:15 +0100
Date: Wed, 8 May 2002 11:30:56 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: jffs-dev@axis.com, MTD List <linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: JFFS2 empty file overhead questions
Message-ID: <20020508113056.A2123@kosh.hut.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Would anybody know exact JFFS2 file size overhead for empty file
and the data structures involved?

I tried to answer this by writing a simple test program that just
created as many empty files it could. The MTD partition size was 3904
KB. Initially after 5 spare block the used space is 320 and available
3584 KB.

My test program created a test directory and then in that one
directory creates files with 10 character long random names. I used
random names so that insertions into index tree would occur at random
places and the index tree should stay balanced and show average
insertion characteristics.

After creating 25531 the used space had grown to 3312 K. Initially
it had been 320K. This would suggest the empty file size overhead on
JFFS2 is (3312 - 320)*1024 / 25531 =  120.00 bytes.

So I assume the empty file overhead is 120 bytes on JFFS2. But where
that 120 bytes comes from?

I also tracked the file creation time. This showed linear first degree
dependence on the number of files created. On that particular device
empty file creation (file open) time can be presented as a function
t_c over the number of created files so far:

      t_c(n) := 0.067 + 0.00013*n [seconds]

The file close time that followed was always 0.

After 25519 files I couldn't track space usage with "df" anymore because
it started to give out of memory message. After 26647 my test program
couldn't run anymore because of out of memory. Needles to say, but
my test program doesn't allocate memory nor leave files open when it
proceeds.

Jarkko Lavinen

PS. Test program available on request.
