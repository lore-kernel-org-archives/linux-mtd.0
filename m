Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhwXs-0000az-Lr
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 16:28:05 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: "Teuling, Sieme" <Sieme.Teuling@echostar.com>
In-Reply-To: <C86A9402F6A07E47B2F50A302DFA9BAE044CBF@alm-exch.europe.echostar.com>
References: <C86A9402F6A07E47B2F50A302DFA9BAE044CBF@alm-exch.europe.echostar.com>
Content-Type: text/plain
Message-Id: <1089145290.26880.9.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Tue, 06 Jul 2004 22:21:31 +0200
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Kernel BUG
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-06 at 17:06, Teuling, Sieme wrote:
> Hi anyone,
> 
> I'm currently using the 2.4.21 kernel with mtd-snapshot-20040621 and a 2.4.
> ilookup patch (included below) on an embedded conexant platform. I sometimes
> run into the error below at the startup of the platform (a short time after
> the mount). Does anybody know where this comes from and if it is possible to
> fix it for the 2.4.21 kernel?

Yes, upgrade to a less ancient kernel. 

> Backtrace: no frame pointer
> Code: 1b00179a e59f0014 eb001798 e3a03000 (e5833000)

The backtrace is meaningless as we do not have much experience in
clairvoyance. Read linux/Documentation/oops-tracing.txt


Thomas
