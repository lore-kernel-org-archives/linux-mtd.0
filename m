Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HRAJO-0004z7-Pv
	for linux-mtd@lists.infradead.org; Tue, 13 Mar 2007 16:57:25 +0000
Message-ID: <45F6D46C.8030100@nokia.com>
Date: Tue, 13 Mar 2007 18:42:20 +0200
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: ext Alexander Schmidt <alexs@linux.vnet.ibm.com>
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
> 
> Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>

It seems we cannot preserve old sysfs structure...

It is fine with me. You and Thomas are the main users, so if it is ok
with you - lets' apply this.

Thomas?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
