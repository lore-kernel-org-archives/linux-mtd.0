Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18ED1t-0003eo-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Nov 2002 18:23:21 +0000
Date: Tue, 19 Nov 2002 19:53:37 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Richard Brunelle <rbrunelle@envitech.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: BBRAM
Message-ID: <20021119185337.GB4756@wohnheim.fh-wedel.de>
References: <3DDA7F28.8030309@envitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3DDA7F28.8030309@envitech.com>
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

On Tue, 19 November 2002 13:12:56 -0500, Richard Brunelle wrote:
> 
> Hi, I have a question concerning a BBRAM from ST, the M48Z512A.
> 
> I'm using the BBRAM mapped at 0xE0000 on a single board computer from 
> VersaLogic. This BBRAM is pageable through access of a special register 
> on the single board computer. I want to map the BBRAM as part of the 
> file system.
> 
> As I understand MTD is appropriate for this purpose, am I right?
> 
> If yes, what are the options in the kernel configuration I need to 
> enable to let the system access the device?
> 
> My guess is CONFIG_MTD_MTDRAM with the appropriate position set to 
> 0xE0000. In this case, what type of device should I see in /dev/?

I've been quite happy with the slram driver. The following options
should be enough:
CONFIG_MTD
CONFIG_MTD_CHAR
CONFIG_MTD_BLOCK
CONFIG_MTD_SLRAM

In the case of a monolithic kernel, you have to append something like
this:
slram=BBRAM,0xE0000,+0x8000
First parameter is the device name, second is the device start, third
is the device end or device length (length starts with +).

You have to make sure that the vm doesn't claim the same memory,
though. Maybe you also need something like mem=8M.

David, there is some Documentation floating around, but not in
/usr/src/linux/Documentation, where most people would expect it. What
would I have to do to change that? Commit to cvs? Bitkeeper tree?
Patch to you/Linus/Marcelo?

Jörn

-- 
The cost of changing business rules is much more expensive for software
than for a secretaty.
-- unknown
