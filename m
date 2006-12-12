Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GuGcY-00081x-GE
	for linux-mtd@lists.infradead.org; Tue, 12 Dec 2006 18:01:12 -0500
Received: by ug-out-1314.google.com with SMTP id m2so1768549uge
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Dec 2006 15:01:08 -0800 (PST)
Message-ID: <90e974410612121501x67c7650aq9549b3d508bcf939@mail.gmail.com>
Date: Tue, 12 Dec 2006 15:01:07 -0800
From: "Daniel Robinson" <danielgrobinson@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: intel p30, unlocking before loading driver, again
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

I have a board with a P30 part on it and here are the knowns:

1) the P30 powers up with all blocks locked.

2) if the driver gets loaded with the blocks locked, mode is 0660
(rw-rw----), which allows me to open the device in O_RDWR mode, will
let me do ioctl() calls to unlock blocks, but won't let me write to
the device.  The ioctl() returns without error, but writing fails
because it is a read only file system.

3) In an attempt to increase robustness for a system that will be
embedded, I want to limit the amount of the part that is unlocked and
available for writing.  Ideally, I would like to control that
parametrically.

I can't find the place in the flash device is checked for being
unlocked and the bits are set that indicate that it is a read-only
device.

Thanks in advance,

Dan
