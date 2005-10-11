Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EPKpf-0002E7-9z
	for linux-mtd@lists.infradead.org; Tue, 11 Oct 2005 10:10:29 -0400
Date: Tue, 11 Oct 2005 16:09:44 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20051011140944.GD12561@wohnheim.fh-wedel.de>
References: <5080.61.95.208.3.1128750482.squirrel@61.95.208.3>
	<43479777.5060309@ru.mvista.com>
	<1128765885.1728.82.camel@tglx.tec.linutronix.de>
	<4347C82A.3060209@ru.mvista.com> <434A2452.3090107@arcom.com>
	<1128958693.32503.2.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1128958693.32503.2.camel@windu.rchland.ibm.com>
Cc: nreddy@netenrich.com, Vitaly Wool <vwool@ru.mvista.com>, tglx@linutronix.de,
	linux-mtd@lists.infradead.org
Subject: Re: "Timing issue when we use SPANSION 8MB Flash"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 10 October 2005 10:38:13 -0500, Josh Boyer wrote:
> 
> And if what you are after is a read-only compressed filesystem, I would
> recommend squashfs over cramfs.

Not unconditionally.  There is a reason why cramfs is not merged into
the kernel yet.  While its pure performance numbers (compression rate,
etc) are better, the code has its issues.  Biggest offender is the use
of bitfields, which are duplicated depending on the endianness of the
filesystem and the host machine.

YMMV, so I won't give any recommendation either way.

Jörn

-- 
A surrounded army must be given a way out.
-- Sun Tzu
