Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18K2dU-0002kn-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2002 20:30:16 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6N004B3ZOKVS@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 05 Dec 2002 22:00:21 +0100 (MET)
Date: Thu, 05 Dec 2002 21:58:18 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Write error on the nand flash !
In-reply-to: <00512BA4F9D3D311912A009027E9B8F407E4A6@NT>
To: Dave Ellis <DGE@sixnetio.com>,
 'shadow' <saturn@structure.biochem.nchu.edu.tw>
Cc: linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200212052158.18426.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <00512BA4F9D3D311912A009027E9B8F407E4A6@NT>
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

On Thursday 05 December 2002 19:57, Dave Ellis wrote:
> My patch at
>  http://lists.infradead.org/pipermail/linux-mtd/2002-October/006218.html
> fixes a problem with nand_write_page that could cause this. It is
> not in the latest CVS version of nand.c.
>
> Dave
Dave,
Thanx for remebering me. It got lost anyhow. 
Fixed in CVS.

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
