Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cf2lz-0005YM-MX
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 16:02:56 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041216205102.GC10285@wohnheim.fh-wedel.de>
References: <BCEFJBPJCGFCNMMMIDBHAEMECJAA.Joakim.Tjernlund@lumentis.se>
	<1103229452.27708.6.camel@tglx.tec.linutronix.de>
	<20041216205102.GC10285@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=utf-8
Date: Thu, 16 Dec 2004 22:02:50 +0100
Message-Id: <1103230970.27708.14.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Joakim.Tjernlund@lumentis.se,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-12-16 at 21:51 +0100, Jörn Engel wrote:
> real    0m0.395s
> user    0m0.326s
> sys     0m0.067s
> 
> The algorithm doesn't run that fast, though.

Makes sense, as the modulo in your loop is a provided by the div
instruction on x86. I used this on a CPU where no modulo result was
available.

tglx
