Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aq5YR-0001JP-Kc
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2004 07:10:03 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HST002R62K53S@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 09 Feb 2004 08:09:42 +0100 (MET)
Date: Mon, 09 Feb 2004 08:07:49 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <200402081722.19858.joshua@joshuawise.com>
To: Joshua Wise <joshua@joshuawise.com>, linux-mtd@lists.infradead.org
Message-id: <200402090807.49862.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <200402081722.19858.joshua@joshuawise.com>
Subject: 
	Re: Fwd: Re: JFFS2 NAND support - Mount failure on "good" filesystem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 08 February 2004 23:22, Joshua Wise wrote:
> <tglx1> joshua_: send a patch to the maillist :)

You should subcribe to linux-mtd-cvs@lists.infradead.org.
Then you had not missed:

Update of /home/cvs/mtd/drivers/mtd/nand
In directory phoenix.infradead.org:/tmp/cvs-serv15636

Modified Files:
        nand.c 
Log Message:
support for chips which doe not support page autoincrement

--Update of /home/cvs/mtd/include/linux/mtd
In directory phoenix.infradead.org:/tmp/cvs-serv15725

Modified Files:
        nand.h 
Log Message:
option field added to nand structure. support for chips without page 
autoincrement
 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
