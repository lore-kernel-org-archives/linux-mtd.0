Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WfyB-0004kR-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2003 16:55:51 +0000
Date: Thu, 9 Jan 2003 18:26:26 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Frank R Callaghan <f.callaghan@ieee.org>
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
Subject: Re: Help! AMD Config Advice
Message-ID: <20030109172626.GA2589@wohnheim.fh-wedel.de>
References: <200301091146.13337.f.callaghan@ieee.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200301091146.13337.f.callaghan@ieee.org>
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

On Thu, 9 January 2003 11:46:13 -0500, Frank R Callaghan wrote:
> Subject: Help! AMD Config Advice
> 
> Is there no solution to this question ?
> am I asking the wronge group ?
> is it so stupid it does not deserve a responce ?

It had the correct subject to be ignored. ;)

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

Maybe, but you have already tried the obvious. And it is a very odd
request, that you have too _much_ storage. 

My first guess is that physmap calls up the cfi probing. cfi tells the
kernel about a 2MiB-Chip and that is what the kernel uses. Whether
this is correct behaviour or not, I don't want to decide.

> also I'm looking to use jffs2 as the file system - maybe I can partion it
> to only use the second meg ???

This would be the easiest. Easiest is to copy physmap.c and hardcode
the partitioning, as is already done dozens of time. Not pretty, but
simple.


Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
