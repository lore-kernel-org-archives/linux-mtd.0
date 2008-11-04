Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KxR0W-0004oW-6r
	for linux-mtd@lists.infradead.org; Tue, 04 Nov 2008 18:52:04 +0000
Received: by wf-out-1314.google.com with SMTP id 28so3426746wfc.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 Nov 2008 10:52:02 -0800 (PST)
Message-ID: <ecdd5ced0811041052t6eb1e17flcd2a212f3f99003a@mail.gmail.com>
Date: Tue, 4 Nov 2008 13:52:02 -0500
From: "Andrew Xiang" <andrewxiang@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: data corruption, power failure
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using JFFS2 on 2.6.12 kernel. I have 2 big images in a same
subdirectory on the jffs2 NOR partitions. One image is squashfs
mounted, another one I am overwriting. During the process, a power
failure happen. After the system comes up, I see no error during the mount.
The file I am overwriting is not complete, that is okay, I delete that
anyway. But the one I am reading (squashfs mounted) is corrupted. Here
is error I get when I do a copy
[273629.868000] Data CRC 84b7bbfd != calculated CRC 63e69361 for node
at 02d399fc
cp: read error: Input/output error

Do you know what is reason?

How does JFFS2 handle power failure correctly? To guarantee that, you
need atomic write operation on the flash. Like when you do an GC erase
and put a special marker. You can do a incomplete erase and power
failure happen, leave it in a state not possible to determine if it is
valid or obsolete or clean.

And how come mount does not detect the error, I thought mount go
through and check every block.

-Andrew
