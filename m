Received: from web20302.mail.yahoo.com ([216.136.226.83])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15w2Z5-0001b6-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 15:30:00 +0100
Message-ID: <20011023143913.42416.qmail@web20302.mail.yahoo.com>
Date: Tue, 23 Oct 2001 15:39:13 +0100 (BST)
From: =?iso-8859-1?q?David=20Mackay?= <monitoreurope@yahoo.co.uk>
Subject: JFFS
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Hi,

Could someone shed some light on a difficulty we are
experiencing? We have an X86 board with 8meg of flash
and 16meg of RAM. As you can see from the df output
below most is mounted as / with a meg or so as /var
and a 2meg ram disk mounted as /var/tmp. However we
are finding that the df output differs substantially
from the actual usage, as you can see from the du on
the var directory tree we should only be using 132K
whereas df suggests 552K. We understand that the file
system itself will need a little space and on top of
that there will be some wastage. Indeed if we fill
/var up with files it does clean itself to an extent
but we are still some 40% short.

As we use /var for FIFO data storage on this system
(many 8-32K files) we need a reliable predictable free
space estimation in order to be able to maximise the
number of stored files before we delete to add new.
Therefore a better understanding of the inner workings
of JFFS would be appreciated.

arcom@ME /var$ du -s *
3       home
0       lock
0       log
129     me
0       run
34      tmp
arcom@ME /var$ df
Filesystem           1k-blocks      Used Available
Use% Mounted on
/dev/root                 5888      5524       364 
94% /
/dev/mtdblock1            1152       552       600 
48% /var
/dev/ram0                 2011        52      1857  
3% /var/tmp
arcom@ME /var$ 

Many thanks, David

____________________________________________________________
Nokia Game is on again. 
Go to http://uk.yahoo.com/nokiagame/ and join the new
all media adventure before November 3rd.
