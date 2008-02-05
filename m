Received: from ipn36372-d52026.cidr.lightship.net ([216.204.15.186]
	helo=zeus.bittware.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JMRiz-0007Pk-CG
	for linux-mtd@lists.infradead.org; Tue, 05 Feb 2008 17:36:55 +0000
Message-ID: <47A89DDF.4050505@bittware.com>
Date: Tue, 05 Feb 2008 12:33:19 -0500
From: DMcLeod <dmcleod@bittware.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,
	uClinux development list <uclinux-dev@uclinux.org>
Subject: Filling RAM
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am seeing that as files are created, their approximate size is 
subtracted from the available memory. For example, assume I have /home  
mounted from /dev/mtdblock2, which is a jffs2 filesystem on NOR flash. 
The following procedure reproduces the problem consistently:

[code]
]# cat /proc/mounts
rootfs        /     rootfs  rw     0 0
/proc        /proc     proc     rw     0 0
sysfs        /sys     sysfs     rw     0 0
/dev/mtdblock2    /home     jffs2     rw,sync 0 0

]# cd /home
]# grep MemFree /proc/meminfo
22588 kB
]# dd if=/dev/zero of=1M.dat bs=1M count=1
...
]# grep MemFree /proc/meminfo
21522 kB
]# rm 1M.dat
]# grep MemFree /proc/meminfo
22576 kB
[/code]

I'm fairly certain the file does get written to flash as it is 
noticeably slower than creating a file of the same size in ramfs. So it 
seems like the file is stored in RAM as well, how/why would this happen?

ps - XATTRS is off,  JFFS2_SUMMARY is off, JFFS2_VERBOSITY = 0,


Any help is greatly appreciated.
