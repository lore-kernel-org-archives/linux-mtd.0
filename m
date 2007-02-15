Received: from py-out-1112.google.com ([64.233.166.176])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HHhTJ-00022P-TS
	for linux-mtd@lists.infradead.org; Thu, 15 Feb 2007 09:20:32 -0500
Received: by py-out-1112.google.com with SMTP id p76so284157pyb
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Feb 2007 06:20:27 -0800 (PST)
Message-ID: <e167438e0702150620t4291198dxd627d102cba6519f@mail.gmail.com>
Date: Thu, 15 Feb 2007 08:20:27 -0600
From: "Julianne C." <juliannerc@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: OneNAND: Unexpected zero blocks
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

In using the 2.6.20 kernel with onenand enabled and active we:

1) see the partitions setup in the kernel boot messages

2) can mount a partition:  mount -t jffs2 /dev/mtdblock3 /mnt

3) copy the rootfs (about 2 MB) to the new fs on /mnt

When the fs is unmounted, and remounted again, we see some files in which
two to four blocks of zeros occur (0x2000), or blocks with some
initial data filled
in 20 to 40 bytes and the rest zeros.

Is this a known problem with the onenand parts or the driver?

Where can one obtain a copy of the latest driver
   (without having to use git since we can't access git archives
behind our firewall)

(The board is a LogicPD  PXA270 with one 64 MB Samsung device - used for both
boot and OS file systems.)
