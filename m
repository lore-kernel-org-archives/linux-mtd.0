From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1111849424.4522.0.camel@tglx.tec.linutronix.de>
References: <a2cb6db60503260318343be275@mail.gmail.com>
	<1111849424.4522.0.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Sat, 26 Mar 2005 14:09:01 +0000
Message-Id: <1111846142.15354.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Zeri Virgo <sillyzeri@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: boot from diskonchip with jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-03-26 at 16:03 +0100, Thomas Gleixner wrote:
> > Is it feasile to use jffs2 for the root filesystem?
> 
> The new DoC driver in drivers/mtd/nand supports JFFS2.

Yes, but you'll need a bootloader capable of reading the kernel from it.


-- 
dwmw2
