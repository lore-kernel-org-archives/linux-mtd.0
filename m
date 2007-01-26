Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HAOoi-0003ty-Dz
	for linux-mtd@lists.infradead.org; Fri, 26 Jan 2007 06:00:28 -0500
Message-ID: <39678.212.184.22.162.1169809215.squirrel@www.tglx.de>
In-Reply-To: <1169656229.3609.4.camel@sauron>
References: <20070122230954.1b7f77e6.b.spranger@linutronix.de>
	<1169656229.3609.4.camel@sauron>
Date: Fri, 26 Jan 2007 12:00:15 +0100 (CET)
Subject: Re: [PATCH][UBI] remove __exit on functions referenced in '.text'
	or '.init.text'
From: bene@linutronix.de
To: dedekind@infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Benedikt Spranger <b.spranger@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> Yeah, I was actually planning to do the same and get rid of most
> __init/__exit. But still out of curiosity, may you please elaborate on
> the problem?

The Problem is simple: the kernel does not link. The linker reports the
cross section references as errors. Here is an example:

`ubi_sysfs_vol_close' referenced in section `.text' of drivers/built-in.o:
defined in discarded section `.exit.text' of
drivers/built-in.o`ubi_sysfs_vol_close' referenced in section `.text' of
drivers/built-in.o: defined in discarded section `.exit.text' of
drivers/built-in.o`ubi_sysfs_vol_close' referenced in section `.text' of
drivers/built-in.o: defined in discarded section `.exit.text' of
drivers/built-in.o`ubi_sysfs_close' referenced in section `.text' of
drivers/built-in.o: defined in discarded section `.exit.text' of
drivers/built-in.o`ubi_sysfs_close' referenced in section `.init.text' of
drivers/built-in.o: defined in discarded section `.exit.text' of
drivers/built-in.o

Bene
