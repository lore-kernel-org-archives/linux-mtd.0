Received: from [67.106.152.115] (helo=amperion.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 193yuD-0003yO-Hx
	for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2003 14:49:25 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 11 Apr 2003 09:49:26 -0400
Message-ID: <C6D44AA99ECEB540A5498F15F92DA07D89227F@amperion01>
From: "Marc D'Anjou" <marcd@amperion.com>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Long JFFS2 Mount time?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I am using an embedded system with an IBMPPC405h and one bank (16meg)
Intel strata flash. The page size is 4k bytes. The sector size is 128k
bytes.  I am using the MTD Flash driver with the JFFS2 software version
2 (newest files dated 7/2002). I'm not sure what the CVS revision number
is?=20

I am storing a system log inside the JFFS2. Only critical events are
stored there for debugging purposes. In general I only store 4 entries
per run time. Our system is such that it can go up and down daily. As
our log grows, the JFFS mount time appears to be growing quite a bit. It
went from less than 1 second when we first started, to up to 7 or more
minutes over days.=20

My concern is that the mount time could grow to hours. There is a
possibility that this has happened in a system.

To test this concern, I executed a one line script that appends 450
bytes repeatedly to the log file in the JFFS2. This was continued until
the log file size grew to 2 Meg bytes. =20

" cat file1.txt >> /mnt/jffs2/file.log "                  where
file1.txt contains 450 bytes (ascii text file).

Then I reset the system and watched how long it took to mount the JFFS2.
It took about 13 minutes to mount!!!!

I then did:  "ls -l" of the directory and it took about 30 minutes to
come back???????

The second and subsequent "ls -l" was very quick (normal speed for an
ls). It acted as if all the information was cached.

My understanding is that each time we append a 450 byte entry, a new
page in the JFFS2 is obtained, it copies the previous page contents,
plus the new 450 byte entry, then marks the old page for deletion. If
this is repeated many times, the Garbage Collection Task will require
more time to resolve the JFFS2 when it mounts the next time up. There
will be many pages marked for deletion, essentially a longer trail of
pages to resolve.

Is this your understanding of the problem??

Does anyone know how to get around this problem???=20

Is there newer JFFS2 software available that minimize this behavior?

=20
Marc D. D'Anjou

=20
