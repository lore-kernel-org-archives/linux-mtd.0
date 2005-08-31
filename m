Received: from toxygen.net ([213.146.59.4])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAWVX-0006mB-La
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2005 13:36:23 -0400
Message-ID: <4315EA57.20104@toxygen.net>
Date: Wed, 31 Aug 2005 19:35:19 +0200
From: Wojtek Kaniewski <wojtekka@toxygen.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Subject: CRC problems with current JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Couple of days ago I tried to setup JFFS2 filesystem on a NAND chip. 
After dealing with missing ECC (although I enabled it in the driver) and 
mysterious CRC errors I went to MTD website and found that the 2.4 
kernel tree that I'm using is unsupported. Unfortunately I can't switch 
to 2.6 because I doesn't seem to support WBC's PPChameleon boards. So I 
have backported current JFFS2 and MTD drivers to 2.4. Unfortunately it 
solved only the ECC issues. I still get CRC errors. The strange thing is 
that they occur only when dealing with symlinks, the rest of the 
filesystem is copied without complaints. For example, copying 50MB /usr 
results in no errors, but 5MB /lib gives:

~ # cp -a /lib /mnt/flash
Node CRC 88217c9d != calculated CRC 2e2558a6 for node at 00e779c8
cp: unable to preserve ownership of `/mnt/flash/lib/ld.so.1':
Input/output errorNode CRC 9b96bd4b != calculated CRC a58fd4f1 for node
at 00d047f0
cp: unable to preserve ownership of `/mnt/flash/lib/libexpat.so':
Input/output error
Node CRC ffffffff != calculated CRC f09e7845 for node at 00945184
cp: unable to preserve ownership of `/mnt/flash/lib/libcrypt.so.1':
Input/output error

The failed symlinks are never the same. Besides, they seem quite normal 
even though there were errors:

~ # ls -l /mnt/flash/lib/ld.so.1
lrwxrwxrwx    1 root     root           11 Jan  1 01:19
/mnt/flash/lib/ld.so.1 -> ld-2.3.1.so

I'm quite stuck now, because the only reasonable answers for CRC 
problems I've found in list archive and Google were flash corruption and 
outdated JFFS2 drivers. Unfortunately the NAND chips were soldered 
couple of days ago and the JFFS2 were taken from CVS HEAD this week.

The system is a modified 2.4.20 running on IBM PowerPC 405EP with 
backported MTD/JFFS2 drivers. NAND chip is ST NAND512Wxx. If some more 
information is needed I'll be glad to provide it.

Regards,
Wojtek
