Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.60 #1 (Red Hat Linux))
	id 1FQjQ8-0003Vw-9Y
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 12:10:01 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060404093002.GD12277@wohnheim.fh-wedel.de>
References: <20060404092628.GA12277@wohnheim.fh-wedel.de>
	<20060404093002.GD12277@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=utf-8
Date: Tue, 04 Apr 2006 12:09:52 +0000
Message-Id: <1144152592.10601.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@osdl.org>, Simon Evans <spse@secret.org.uk>,
	"Eric W. Biederman" <ebiederman@lnxi.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [Patch 3/3] Remove blkmtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-04-04 at 11:30 +0200, Jörn Engel wrote:
> o Remove the (very recently) deprecated blkmtd driver.
> o Move the Kconfig description over to block2mtd, its replacement.
> 
> Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de

Acked-by: Thomas Gleixner <tglx@linutronix.de>
