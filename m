Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZYbi-0000Nl-EM
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 13:54:18 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20051108183339.GB31446@wohnheim.fh-wedel.de>
References: <20051105162650.620266000@b551138y.boeblingen.de.ibm.com>
	<20051105162712.921102000@b551138y.boeblingen.de.ibm.com>
	<20051108105923.GA31446@wohnheim.fh-wedel.de>
	<m3zmofovsc.fsf@maxwell.lnxi.com>
	<20051108183339.GB31446@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Tue, 08 Nov 2005 19:57:49 +0100
Message-Id: <1131476269.18108.195.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Eric W. Biederman" <ebiederman@lnxi.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/25] mtd: move ioctl32 code to mtdchar.c
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-11-08 at 19:33 +0100, Jörn Engel wrote:

> Can you name a few examples, where mtdchar.c makes sense?  I've found
> it to be quite useless.

How do you access FLASH specific functionality otherwise ?

case MEMGETINFO:
....
case OTPLOCK:

It may be useless for you, but I doubt that you represent the majority
of the MTD user base. Using a RAM simulator is a bit different to the
usage of _real_ FLASH.

Look into mtd/utils and figure yourself why it _is_ useful.

The code _is_ ugly and ioctls are out of fashion, but your "remove it"
request is just silly as long as you dont provide a reasonable
alternative access to those bits.


	tglx
