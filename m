Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JWT7-0007Qk-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 10:09:25 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6L00JRTC9TFA@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 04 Dec 2002 11:39:30 +0100 (MET)
Date: Wed, 04 Dec 2002 11:37:31 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Write error on the nand flash !
In-reply-to: 
 <Pine.LNX.4.44.0212040542320.4326-100000@structure.biochem.nchu.edu.tw>
To: shadow <saturn@structure.biochem.nchu.edu.tw>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200212041137.31306.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: 
 <Pine.LNX.4.44.0212040542320.4326-100000@structure.biochem.nchu.edu.tw>
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

On Tuesday 03 December 2002 23:09, shadow wrote:
> nand_write_ecc: to = 0x001fc000, len = 512
> nand_write_page: Failed write verify, page 0x00000fe0
Do you use latest MTD-CVS code ? If not, please upgrade.
If yes, can I have a look at your hardware driver ?

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
