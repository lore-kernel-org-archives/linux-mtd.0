Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eF1b-00017D-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 13:46:39 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H9J002SZ6CLJW@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 30 Jan 2003 15:17:10 +0100 (MET)
Date: Thu, 30 Jan 2003 15:15:22 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: crc32.h
In-reply-to: <20030130132133.GA13604@lilotux.net>
To: Stephane List <stephane.list@lilotux.net>,
 linux-mtd <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200301301515.22722.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <20030130132133.GA13604@lilotux.net>
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

On Thursday 30 January 2003 14:21, Stephane List wrote:
> I'm using the CVS source code.
> All files in "fs/jffs2" use #include <linux/crc32.h>
> But this file is not part of 2.4.x kernel it's only in 2.5
Please use patches/patchin.sh to patch your kernel

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
