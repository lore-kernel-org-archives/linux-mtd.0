Received: from wproxy.gmail.com ([64.233.184.192])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DFCgU-0008VV-2Q
	for linux-mtd@lists.infradead.org; Sat, 26 Mar 2005 09:54:42 -0500
Received: by wproxy.gmail.com with SMTP id 57so382322wri
	for <linux-mtd@lists.infradead.org>;
	Sat, 26 Mar 2005 06:54:43 -0800 (PST)
Message-ID: <a2cb6db6050326065422c52ac3@mail.gmail.com>
Date: Sat, 26 Mar 2005 14:54:43 +0000
From: Zeri Virgo <sillyzeri@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1111846142.15354.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
References: <a2cb6db60503260318343be275@mail.gmail.com>
	<1111849424.4522.0.camel@tglx.tec.linutronix.de>
	<1111846142.15354.0.camel@localhost.localdomain>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: boot from diskonchip with jffs2
Reply-To: Zeri Virgo <sillyzeri@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 26 Mar 2005 14:09:01 +0000, David Woodhouse <dwmw2@infradead.org> wrote:
> On Sat, 2005-03-26 at 16:03 +0100, Thomas Gleixner wrote:
> > > Is it feasile to use jffs2 for the root filesystem?
> >
> > The new DoC driver in drivers/mtd/nand supports JFFS2.
> 
> Yes, but you'll need a bootloader capable of reading the kernel from it.

Any recommendations on the bootloader-of-choice for diskonchip + jffs2?
