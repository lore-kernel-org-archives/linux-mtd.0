Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FshDV-0001Km-Lz
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 15:28:34 +0100
Subject: Re: [PATCH] AT91RM9200 NAND support
From: Thomas Gleixner <tglx@linutronix.de>
To: Savin Zlobec <savin@epico.si>
In-Reply-To: <44980505.2000003@epico.si>
References: <1150786454.15581.289.camel@fuzzie.sanpeople.com>
	<1150787336.6780.102.camel@localhost.localdomain>
	<1150787823.15614.297.camel@fuzzie.sanpeople.com>
	<4497A723.2070006@epico.si>
	<1150790417.6780.107.camel@localhost.localdomain>
	<4497BAE2.3010602@epico.si>
	<1150795093.6780.117.camel@localhost.localdomain>
	<4497D2CE.7070000@epico.si>
	<1150801960.6780.132.camel@localhost.localdomain>
	<4497DF09.70404@epico.si>
	<1150804501.6780.141.camel@localhost.localdomain>
	<4497E9D4.9040307@epico.si>
	<1150807480.6780.157.camel@localhost.localdomain>
	<4497F1B4.8030702@epico.si>
	<1150809682.6780.172.camel@localhost.localdomain>
	<4497FCA4.1060601@epico.si>
	<1150811833.6780.195.camel@localhost.localdomain>
	<44980505.2000003@epico.si>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 16:29:45 +0200
Message-Id: <1150813786.6780.213.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-06-20 at 16:24 +0200, Savin Zlobec wrote:
> Indeed it is the STATUS command. If I don't wait after it I can't copy
> a single file on the jffs2 partition, inserting a wait there seems to solve
> the problem.

Well, we also delay the codepath in nand_wait() with this. It feels
terribly wrong and the problem is just hidden by that check.

Can you please remove the wait again and add a check of the r/b pin to 

static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip, int state)
{

just before the 

	return status;
}

	tglx
