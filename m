From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1117542307.14566.79.camel@tglx.tec.linutronix.de>
References: <429C5347.1080208@anagramm.de>
	<1117542307.14566.79.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Tue, 31 May 2005 16:51:08 +0100
Message-Id: <1117554669.12591.284.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Clemens Koller <clemens.koller@anagramm.de>, linux-mtd@lists.infradead.org
Subject: Re: Oops on rmmod mtdblock module while in dev dir.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-05-31 at 14:25 +0200, Thomas Gleixner wrote:
> Thats not a problem of mtd. Its a problem of sysfs/devfs

IIRC it's because we register more than one gendisk with the same major.

-- 
dwmw2
