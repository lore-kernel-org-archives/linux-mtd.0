Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QN7l-0001Am-HG
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 09:07:57 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HGC0086IZXBRG@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Thu, 12 Jun 2003 10:08:00 +0200 (MEST)
Date: Thu, 12 Jun 2003 11:06:09 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3EE6EBA0.3080508@intracom.gr>
To: Pantelis Antoniou <panto@intracom.gr>, linux-mtd@lists.infradead.org
Message-id: <200306121106.09768.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <3EE6EBA0.3080508@intracom.gr>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: Cram FS on NAND - How to do this?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 11 June 2003 10:43, Pantelis Antoniou wrote:
> Hi
>
> I have a requirement to have a compressed read only
> root filesystem in my board and I've come to the
> conclussion that the best fit would be CRAMFS if only
> had any concept of bad blocks.

Why don't you use a JFFS2 partition and mount it read only ?
Then you have a compressed read only root filesystem.
All there no hacking required. :)
 
-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
