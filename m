Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HRPmz-0005TX-9e
	for linux-mtd@lists.infradead.org; Wed, 14 Mar 2007 09:29:01 +0000
Message-ID: <45F7BF1D.5020405@nokia.com>
Date: Wed, 14 Mar 2007 11:23:41 +0200
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
Subject: Re: [RFC] [PATCH] UBI: rewrite of sysfs.c
References: <200703131610.20161.alexs@linux.vnet.ibm.com>
In-Reply-To: <200703131610.20161.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexander Schmidt wrote:
> Hi,
> 
> I rewrote the sysfs interface to use struct device instead of struct
> class_device. This implies an interface change, as sysfs files are now
> ordered in a different manner:
> 
> /sys/class/ubi/ubiX/ for device files
> /sys/class/ubi/ubiX_Y/ for volumes
> 
> Before we had
> 
> /sys/class/ubi/ubiX/ for device files
> /sys/class/ubi/ubiX/Y/ for volumes
> 
> Please let me know if you got any objections on this or if you have
> proposals for a better implementation.

Alexander, may I please ask you to to the following experiments with your new changes:

Experiment 1: open sysfs file, and make sure UBI module refcount is increased.
lsmod will help. Please, check this with a UBI device's file and a UBI volume's
file.

Experiment 2: write a program which opens any sysfs file of volume, e.g.,
/sys/class/ubi/ubi0_0/alignment, and keeps it open. Do not close it. Then
remove the corresponding volume (volume 0). Make sure you delete the volume
and do not crash.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
