Received: from metis.pengutronix.de ([213.252.143.165])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CqnZW-0000Ss-Rs
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2005 02:14:42 -0500
Date: Tue, 18 Jan 2005 08:14:13 +0100
From: Robert Schwebel <robert@schwebel.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Message-ID: <20050118071413.GE6312@pengutronix.de>
References: <41E4D801.2000502@imc-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <41E4D801.2000502@imc-berlin.de>
Sender: Robert Schwebel <robert@pengutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: disabling GC?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 12, 2005 at 08:55:45AM +0100, Steven Scholz wrote:
> what would be the impact if I disabled the GC thread on my embedded system?
> 
> I use an JFFS2 partition as root fs. But usually only write to it on 
> firmware update...

Could you just mount it r/o? 

Robert
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
