Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0bj7-0006Wx-AP
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2004 07:32:33 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HUA001JFSXNLW@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 09 Mar 2004 08:32:11 +0100 (MET)
Date: Tue, 09 Mar 2004 08:29:36 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <Pine.LNX.4.10.10403081736410.3052-100000@mail.hurricane.at>
To: Matthias Gorjup <mgorjup@norik.com>, linux-mtd@lists.infradead.org
Message-id: <200403090829.36404.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <Pine.LNX.4.10.10403081736410.3052-100000@mail.hurricane.at>
Subject: Re: Compiling kernel 2.4.20 with the latest snapshot of mtd
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 08 March 2004 18:52, Matthias Gorjup wrote:
> from the mtd CVS repository. I apply the patch by invoking script
> sh patchin.sh /home/gorjup/temp/linux but I get errors when compiling.
> Here are the errors:

Try
sh patchin.sh -j /home/gorjup/temp/linux

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
