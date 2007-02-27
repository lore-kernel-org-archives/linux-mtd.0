Received: from arrows.demon.co.uk ([83.105.72.193])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HMA8H-0000YH-7U
	for linux-mtd@lists.infradead.org; Tue, 27 Feb 2007 16:45:15 -0500
Date: Tue, 27 Feb 2007 21:12:31 +0000 (GMT)
From: John Smith <john@arrows.demon.co.uk>
To: <linux-mtd@lists.infradead.org>
Subject: UBI Tools - problem with multiple ubi devices. 
Message-ID: <Pine.LNX.4.33.0702272101240.7726-100000@arrows.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In
GIT:      users/haver/mtd-utils.git
File:     ubi-utils/src/libubi.c
Function: get_ubi_info

The code counts the number of UBI volumes by looking for files called

  /sys/class/ubi0, /sys/class/ubi1, ...

but the files are actually

  /sys/class/ubi/ubi0, ...

The count starts from 1 (probably also wrong), so is usable if there is a
single UBI device. But if there is more than one UBI device, tools like
ubimkvol fail.

John
