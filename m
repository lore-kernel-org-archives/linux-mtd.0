Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hBEy-0006JT-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 16:48:20 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H15009GEFVP3O@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 20 Aug 2002 17:47:50 +0200 (MEST)
Date: Tue, 20 Aug 2002 17:47:34 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: No free space left for GC
In-reply-to: <1029830371.22775.150.camel@thomas.tec.linutronix.de>
To: =?UTF-8?Q?=E5=B0=8F?= =?UTF-8?Q?=E6=98=8E?= <kevin@gv.com.tw>
Cc: linux-mtd@lists.infradead.org
Message-id: <1029858455.23122.191.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <1029623727.2142.495.camel@thomas.tec.linutronix.de>
 <1029793649.22781.129.camel@thomas.tec.linutronix.de>
 <015501c247f3$d13176a0$b30210ac@gv.com.tw>
 <1029830371.22775.150.camel@thomas.tec.linutronix.de>
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

On Tue, 2002-08-20 at 09:59, Thomas Gleixner wrote:
> 2. The endless gc, which used up all blocks, is fixed now. I will do
> some more tests and put a final version into CVS today.
Is there, please try again. 

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
