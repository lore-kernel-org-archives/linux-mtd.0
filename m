Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16t2Fg-0005PD-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 09:05:48 +0100
Subject: Re: how to use amd_flash.c
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: Steve Tsai <startec@ms11.hinet.net>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <00b001c1dbac$23abbd00$5501a8c0@synso.com.tw>
References: <008801c1dba7$55a5b8b0$5501a8c0@synso.com.tw>
	<1017905022.23995.13.camel@pcjonashg>
	<00b001c1dbac$23abbd00$5501a8c0@synso.com.tw>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 04 Apr 2002 10:07:14 +0200
Message-Id: <1017907634.23996.24.camel@pcjonashg>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, 2002-04-04 at 09:41, Steve Tsai wrote:
> Hi Jonas,
> 
> Thanks. I know how to add codes to amd_flash.c, but I can not make kernel
> run amd_flash_probe(). I used jffs1 and flash.c on my board from AXIS before
> and it works fine. Now I want ot port uClinux 2.4.17 to my board and I plan
> to use jffs2 and mtd, but I found it is more complicated.  The flash I use
> is not CFI compliance, so I am not sure I can use jedec_probe + CFI-driver.

The jedec_probe sets things up so that the CFI-drivers can be used with
non-CFI chips.

> I modified amd_flash.c already, but the kernal can not probe the flash at
> start time. Should I call do_map_probe in somewhere to find out the flash?

Yes, you need to write a map driver that calls do_map_probe. You can
look at arch/cris/drivers/axisflashmap.c for inspiration.

/Jonas
