Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HCbhH-00076g-34
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 08:09:56 -0500
Subject: Re: [RFC] [PATCH 1/1] [MTD] UBI: implement per-volume update
From: Thomas Gleixner <tglx@linutronix.de>
To: Artem Bityutskiy <dedekind@infradead.org>
In-Reply-To: <20070201102111.15629.24289.sendpatchset@localhost.localdomain>
References: <20070201102105.15629.61206.sendpatchset@localhost.localdomain>
	<20070201102111.15629.24289.sendpatchset@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 01 Feb 2007 14:10:38 +0100
Message-Id: <1170335439.29240.277.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alexander Schmidt <alexs@linux.vnet.ibm.com>, linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-02-01 at 12:21 +0200, Artem Bityutskiy wrote:
> This patch removes the global update marker support and everything
> related to it. Now we have per-volume update marker bit in the
> volume table. This makes us incompatible with older UBI images but
> this is not a big deal - UBI is not used so widely so far and we
> can afford dropping legacy stuff now.

Uuurgh. Incompatible in what way ? Does this mean you cannot boot from
an existing image anymore ?

	tglx
