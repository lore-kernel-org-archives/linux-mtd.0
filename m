Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HRA71-0004RJ-JX
	for linux-mtd@lists.infradead.org; Tue, 13 Mar 2007 16:44:38 +0000
Message-ID: <45F6D39D.6050605@nokia.com>
Date: Tue, 13 Mar 2007 18:38:53 +0200
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

It seems this is something we have 

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
