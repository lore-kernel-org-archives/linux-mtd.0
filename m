Received: from pd9e41b01.dip.t-dialin.net ([217.228.27.1] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175A8D-0004zG-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 May 2002 19:56:13 +0100
Message-Id: <200205071901.g47J1sW09350@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: John Sutton <john@scl.co.uk>, linux-mtd@lists.infradead.org
Subject: Re: patches to 2.4.18
Date: Tue, 7 May 2002 21:01:54 +0200
References: <02050719233200.21005@diva.localdomain>
In-Reply-To: <02050719233200.21005@diva.localdomain>
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

On Tuesday, 7. May 2002 20:10, John Sutton wrote:
> I'm a newbie with CVS... but the paragraph above makes it sound like there
> are a number of different branches, and that the one I need is called
> 2.4.19-pre.  So I tried:
No, it means the mtd code in kernel version 2.4.19-pre, which does not 
contain the latest changes.

Latest changes are available from

cvs -d:pserver:anoncvs@cvs.infradead.org:/home/cvs co mtd

-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
