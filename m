Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18HjvN-0001ul-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2002 12:07:13 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6C0086E8E2G8@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Fri, 29 Nov 2002 13:37:15 +0100 (MET)
Date: Fri, 29 Nov 2002 13:35:26 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: JFFS/MTD and Raw access
In-reply-to: <3DE74F50.30675.396F40@localhost>
To: simon@baydel.com, Damien GERANTON <dgeranton@alpha3i.com>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200211291335.26765.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <3DE74F50.30675.396F40@localhost>
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

On Friday 29 November 2002 12:28, simon@baydel.com wrote:
> I have hit exactly the same problem using JFFS2. I am no authority
> on this but, I thought the problem might be caused by the write
> generating different OOB data for input blocks, which are erased or
> only partially written. So I guess what needs to be done is to read
> and copy the DATA and OOB. I think you can do this with the
> nanddump and nandwrite utilities. I guess I will have to try it
> sometime.
On NOR-FLASH dd should work. 

For NAND see http://www.linux-mtd/tech/nand.html

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
