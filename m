From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1106603928.5081.50.camel@tglx.tec.linutronix.de>
References: <1106603928.5081.50.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Mon, 24 Jan 2005 22:09:16 +0000
Message-Id: <1106604557.6480.80.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/fs/jffs2 nodemgmt.c,1.115,1.116
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-24 at 22:58 +0100, Thomas Gleixner wrote:
> > - avoid filing blocks on the clean list when they have wasted
> > space
> 
> That's plain wrong. 

And the first commit I looked at violated the coding style.

-- 
dwmw2
