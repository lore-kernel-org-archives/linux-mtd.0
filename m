Received: from zeke.inet.com ([199.171.211.198])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WfgB-0004iO-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2003 16:37:15 +0000
Received: from tex.inetint.com (tex [172.16.99.35])
	by zeke.inet.com (8.12.1/8.12.1) with ESMTP id h09H85St022499
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jan 2003 11:08:05 -0600 (CST)
Received: from harpo.inetint.com (localhost [127.0.0.1])
	by tex.inetint.com (8.12.1/8.12.1) with ESMTP id h09H82sV029761
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jan 2003 11:08:03 -0600 (CST)
Message-ID: <3E1DAC72.9010109@inet.com>
Date: Thu, 09 Jan 2003 11:08:02 -0600
From: Eli Carter <eli.carter@inet.com>
MIME-Version: 1.0
To: f.callaghan@ieee.org
CC: LinuxMTD <linux-mtd@lists.infradead.org>
Subject: Re: Help! AMD Config Advice
References: <200301091146.13337.f.callaghan@ieee.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

Frank R Callaghan wrote:
> Is there no solution to this question ?
> am I asking the wronge group ?
> is it so stupid it does not deserve a responce ?
> 
> ----------  Forwarded Message  ----------
> 
> Subject: AMD Config Advice
> Date: Thu, 19 Dec 2002 15:31:19 -0500
> From: Frank R Callaghan <f.callaghan@ieee.org>
> To: LinuxMTD <linux-mtd@lists.infradead.org>
> 
> Hi,
> 
> I undrstand this may be a very basic question, but here go's
> 
> I am looking to use an AMD flash chip on my pc104 card
> to store some non-volatile data, the chip is a 2MB part  AMD29F016,
> the BIOS is in the top 128KB of the first mega-byte(do not want to
>  overwrite).
> 
> After setting up the kernel with MDT I get
> cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00200000 00010000 "Physically mapped flash"
> 
> ok but I only need the second 1MB - is there some way to 
> prevent the first meg being mapped/used ?
> 
> Kernal Version 2.4.19 with:
[snip config]
> also I'm looking to use jffs2 as the file system - maybe I can partion it
> to only use the second meg ???

You should be able to partition the MTD device by the commandline or a 
redboot table.
I believe jffs2 requires at least 5 'sectors' on the chip, though I've 
not used it.  You would need to check the layout of your device has 
enough for it.
That's about the extent of my knowledge at the moment... I hope it gives 
you enough to google on...

HTH,

Eli
--------------------. "If it ain't broke now,
Eli Carter           \                  it will be soon." -- crypto-gram
eli.carter(a)inet.com `-------------------------------------------------
