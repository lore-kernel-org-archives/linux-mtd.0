Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Y8bi-0007WX-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2002 16:38:10 +0000
Subject: Re: chip drivers
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <1012837670.4248.5.camel@pcjonashg>
References: <1012574966.21595.10.camel@pcjonashg>
	<1012571237.21594.8.camel@pcjonashg> <1012561603.21481.4.camel@pcjonashg>
	<29597.1012570470@redhat.com> <31144.1012571348@redhat.com>  
	<8523.1012575879@redhat.com>  <1012837670.4248.5.camel@pcjonashg>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 05 Feb 2002 17:48:45 +0100
Message-Id: <1012927725.13513.13.camel@pcjonashg>
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

> Do I have to change the interface of the probe functions (I need the
> address of the last found alias without "manually" looking for aliases
> like the probe functions do)?

I'm giving up on making the ultimate super-mega-grand-flash-probe-de-lux
that only needs one map and a window size to magically find all chips
within that window. The more I try the more problems I find.

I will just do cfi_probe and jedec_probe on the two chip selects (two
maps) on the hardware I use (ETRAX 100LX) and assume that noone mounts
different chips on the same map (it requires external hardware to mount
more than one chip on each chip select anyway). That will cover all
existing hardware configurations that I know of. The code will be
hardware-specific so I will not make it a part of MTD (I'll just put it
in our linux/arch/cris/axisflashmap.c when I'm done).

/Jonas
