Subject: Re: /proc/mtd and flash information
From: David Woodhouse <dwmw2@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0610271433390.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610271433390.25906@lnxricardw.se.axis.com>
Content-Type: text/plain
Date: Fri, 27 Oct 2006 16:23:16 +0300
Message-Id: <1161955396.7638.57.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-10-27 at 14:44 +0200, Ricard Wanderlof wrote:
> It seems to me that /proc/mtd is a little short on information.
> 
> It would be nice to see the type of media (NOR, NAND etc), write and oob 
> size (for NAND), perhaps a couple of other things for NAND such as the 
> number of bad blocks within a partition. 

Sensible idea, but do it with class_devices in sysfs.

-- 
dwmw2
