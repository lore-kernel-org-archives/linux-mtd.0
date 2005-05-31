From: David Woodhouse <dwmw2@infradead.org>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1117554933.4821.2.camel@weaponx.rchland.ibm.com>
References: <429C5347.1080208@anagramm.de>
	<1117542307.14566.79.camel@tglx.tec.linutronix.de>
	<1117554669.12591.284.camel@hades.cambridge.redhat.com>
	<1117554933.4821.2.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain
Date: Tue, 31 May 2005 16:57:49 +0100
Message-Id: <1117555070.12591.287.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, Clemens Koller <clemens.koller@anagramm.de>,
	linux-mtd@lists.infradead.org
Subject: Re: Oops on rmmod mtdblock module while in dev dir.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-05-31 at 10:55 -0500, Josh Boyer wrote:
> It's even more complicated when working with partitions.  A MTD
> partition is actually a whole new device to MTD, whereas a partition in
> general block terms is just a subset of a particular device.  Things in
> this area need some help.

That's just a terminology mismatch though, and shouldn't really be
relevant.

-- 
dwmw2
