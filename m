Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9WoC-00007r-Ek
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 22:34:24 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: tharbaugh@lnxi.com,
	Magnus =?iso-8859-1?q?M=E5rtensson?= <magnus.martensson@axis.com>
Date: Wed, 15 Oct 2003 10:39:03 +1300
References: <3C6BEE8B5E1BAC42905A93F13004E8AB03202232@mailse01.axis.se>
	<1066152707.10573.20.camel@tubarao>
In-Reply-To: <1066152707.10573.20.camel@tubarao>
MIME-Version: 1.0
Message-Id: <20031014213315.CA9124D6D@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: word line disturbance
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm using the flash embedded in a AT91FR4042 (single chip ARM7-based micro + 
512kB flash + 256kB RAM).  The flash is essentially an AT49xV4096A.

This device has 4 sectors: 1x16kB "boot", 2x8kB "parameter" and 1x480kB 
"application". The datasheet/appnote warns that  reprogramming the boot can 
impact other sectors. Also, reprogramming the application area  can disturb 
the parameter areas.

At first I just blew this off as just a theoretical possibility, but found 
that these disturbances do occur on a regular basis (seen on 5 out of 5 proto 
devices) - particularly upgrading the application area corrupting the 
parameter areas.

-- Charles
