Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18flva-0001G1-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2003 19:06:46 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H9Q0013MYEF7P@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 03 Feb 2003 20:06:16 +0100 (MET)
Date: Mon, 03 Feb 2003 20:04:17 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3E3E517F.9010908@laser5.co.jp>
To: Vishal <vishal@laser5.co.jp>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200302032004.17611.tglx@linutronix.de>
MIME-version: 1.0
References: <3E3E517F.9010908@laser5.co.jp>
Subject: Re: help: bootloader for loading kernel from mtdblock device on
 flash........
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
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

On Monday 03 February 2003 12:24, Vishal wrote:
> Hi all,
>   I am a mtd newbie, and have been assigned the task of writting a boot
> loader that can boot a kernel file placed in a mtdblock device, on NAND
> flash( Samsung K9F2808U08). I would like suggestions on going about with
> this process. If some one could take some time to at least list down the
> steps involved in the same, it would be of immense help me.
What CPU architecture ?
-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
