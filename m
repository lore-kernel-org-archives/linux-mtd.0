Received: from pd9eb95f5.dip.t-dialin.net ([217.235.149.245] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175ZAN-0006Up-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 22:40:08 +0100
Message-Id: <200205082146.g48Lk1919043@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Frederick Lefebvre <flefebvre@irg.ca>
Subject: Re: Current status JFFS2 on DOC
Date: Wed, 8 May 2002 23:46:00 +0200
Cc: linux-mtd <linux-mtd@lists.infradead.org>
References: <MPBBIIEFELAEABNCNHMMGELBDAAA.mailinglists@grimmerink.nl> <1020881319.14408.52.camel@zeus>
In-Reply-To: <1020881319.14408.52.camel@zeus>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wednesday, 8. May 2002 20:08, Frederick Lefebvre wrote:
> I am working, among many, many other things on getting JFFS2 on a DOC
> 2000.  I do not know when it will be ready since I've got so much work
> right now.
Just for my curiosity. Are you going to implement it on top of the generic 
NAND driver, with a DOC specific hardware driver ?

-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
