Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aCFk-0000f9-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 10:28:16 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H05001Y5RM950@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 01 Aug 2002 11:27:46 +0200 (MEST)
Date: Thu, 01 Aug 2002 11:28:24 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: do i have to "eraseall" first?
In-reply-to: <00f801c2390a$d956dd40$1b0448c0@gv.com.tw>
To: ?? <kevin@gv.com.tw>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <0H05001Y6RM950@smtp-out.bhp.t-online.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <013d01c2388f$94c655a0$1b0448c0@gv.com.tw>
 <0H04006C5M7GUI@smtp-out.bhp.t-online.de>
 <00f801c2390a$d956dd40$1b0448c0@gv.com.tw>
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

On Thursday, 1. August 2002 05:23, ?? wrote:
> dear all,
>
> the only different config settings is CONFIG_JFFS2_FS_NAND
> but there is no "CONFIG_JFFS2_FS_NAND" in source of jffs2/mtd here!!
> (i'm using lastest jffs2/mtd source from cvs)
> please help
Sorry, CONFIG_JFFS2_FS_NAND is not patched in. Please add it manually. 

See updated information at http://www.linux-mtd.infradead.org/tech/nand.html

-- 
Thomas
___________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
