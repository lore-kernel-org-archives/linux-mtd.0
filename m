Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18YZqY-000206-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 22:47:50 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20030114214510.GC19834@wohnheim.fh-wedel.de> 
References: <20030114214510.GC19834@wohnheim.fh-wedel.de>  <E18XNfT-0003Sp-00@spoinky.renegade.org.uk> 
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: Simon Evans <spse@secret.org.uk>, linux-mtd@lists.infradead.org
Subject: Re: default readv/writev functions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Jan 2003 23:18:33 +0000
Message-ID: <5351.1042586313@passion.cambridge.redhat.com>
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

joern@wohnheim.fh-wedel.de said:
>  IMHO this is the wrong place. This should go into drivers/mtd/chips/
> cfi_cmdset*.c.

I disagree. All chips -- or at least all NOR chips -- are going to want to
use the same implmementation it because there's almost no point in actually
having their own.

Maybe having it in chips/chipreg.c makes almost as much sense, but there 
are standalone devices like the LART driver which would want it.

--
dwmw2
