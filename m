Received: from dae-bdn.pipeline.ch ([195.134.130.254] helo=mail.mpl.ch)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aq6dv-0001YW-4i
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2004 08:19:47 +0000
Received: from elsoft.ch (IDENT:1000@pcdm.elsoft.loc [192.168.11.10])
	i198JUcq006137
	for <linux-mtd@lists.infradead.org>; Mon, 9 Feb 2004 09:19:30 +0100
Message-ID: <402742B0.9030400@elsoft.ch>
Date: Mon, 09 Feb 2004 09:20:00 +0100
From: =?ISO-8859-1?Q?=22David_M=FCller_=28ELSOFT_AG=29=22?=
 <d.mueller@elsoft.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <200402081722.19858.joshua@joshuawise.com>
	<200402090807.49862.tglx@linutronix.de>
In-Reply-To: <200402090807.49862.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: 
	Re: Fwd: Re: JFFS2 NAND support - Mount failure on "good" filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

Thomas Gleixner wrote:
> 
> Update of /home/cvs/mtd/drivers/mtd/nand
> In directory phoenix.infradead.org:/tmp/cvs-serv15636
> 

What about accesses which cross a block boundary. I think this case is
still not correctly handled.

Dave
