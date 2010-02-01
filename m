Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nbyxp-00058g-5b
	for linux-mtd@lists.infradead.org; Mon, 01 Feb 2010 16:17:30 +0000
Received: by bwz4 with SMTP id 4so3643499bwz.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Feb 2010 08:17:24 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
Date: Mon, 1 Feb 2010 11:17:23 -0500
Message-ID: <152584231002010817n765ffd96j7f628d1f23a84b7c@mail.gmail.com>
Subject: fsck.ubifs?
From: Jon Ringle <jon@ringle.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have my ubi0 partitioned with two static volumes: kernel and
squashfs, and one dynamic volume: ubifs.
One of the tests that I do to test for recovery from corruption is
perform a flash_erase on random blocks on the mtd device that ubi0 is
on and reboot. During bootup, I am able to easily detect corruption in
the static ubi volumes with the crc checksum and these images are
automatically reflashed.
However, if there is corruption in the ubifs, quite often ubifs mounts
successfully and only when trying to access files are problems being
reported. Is there any kind of fsck.ubifs type of utility that can be
used to help with this problem?

Thanks,
Jon
