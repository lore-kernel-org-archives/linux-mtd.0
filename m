Received: from yorgi.telenet-ops.be ([195.130.133.69])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NDlYP-0005Te-DL
	for linux-mtd@lists.infradead.org; Thu, 26 Nov 2009 21:07:09 +0000
Received: from georges.telenet-ops.be (georges.telenet-ops.be [195.130.137.68])
	by yorgi.telenet-ops.be (Postfix) with ESMTP id EED7758832C
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Nov 2009 22:07:03 +0100 (CET)
From: "Ronny Dierckx" <ronny.dierckx@telenet.be>
To: <linux-mtd@lists.infradead.org>
Subject: UBIFS synchronisation questions about file create/delete
Date: Thu, 26 Nov 2009 22:06:51 +0100
Message-ID: <001301ca6edc$5fc49660$1f4dc320$@dierckx@telenet.be>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: nl-be
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm using UBIFS (git://git.infradead.org/~dedekind/ubifs-v2.6.27.git)
on an ARM device with OneNAND flash.

I've been reading the documentation, FAQ, ... about sync/fsync/fdatasync and
the
write-back buffers, but there are still some things I don't understand.

I create a file with vi, write some data in it, close it, don't call sync.
Then 
after waiting 10 minutes I cut the power. When the system is restarted, the
file is
not there anymore?! Is this normal behavior? Shouldn't there be at least
a file of 0 bytes because "UBIFS operations which change directory entries
are synchronous"?
Doesn't this mean that creating or deleting a file entry doesn't require a
sync ?

Thanks,

Ronny Dierckx
