Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15A7Is-0002j0-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2001 10:51:10 +0100
To: Jim_Ravan@avid.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Intel 82802
References: <85256A69.006E78AB.00@aamta02.avid.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 13 Jun 2001 03:56:01 -0600
In-Reply-To: Jim_Ravan@avid.com's message of "Tue, 12 Jun 2001 16:05:56 -0400"
Message-ID: <m3bsns4sb2.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Jim_Ravan@avid.com writes:

> All,
> 
> I'm a newbie, so forgive me ahead of time. I looked back about a year and a half
> 
> in the archives but could find no mention of the Intel 82802 MTH boot flash/RNG.

I looked at these devices a while ago an they don't look too hard to
support.  Though last time I looked at the code they weren't
supported.  They are simple like most flash devices.  I haven't double
checked but they may support the standard intel flash command set from
the software side, in which all that is needed is to write a mapping driver.

> > Is this device supported? Actually I should say "these devices" since the part
> is available in 512KB and 1MB configurations.
> 
> Once I get my IBM PC motherboard booted using perhaps a (new) version of
> Linux/BIOS, I would like to use MTD to update the flash under program control.
> The overall idea is to allow a new Linux kernel to be flashed at will.

Eric
