Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HAPRR-0004Ha-EA
	for linux-mtd@lists.infradead.org; Fri, 26 Jan 2007 06:40:30 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e4.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id l0QBeMKc007762
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2007 06:40:22 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l0QBd5Bg304664
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2007 06:39:05 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l0QBd5Ye004147
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2007 06:39:05 -0500
Subject: Re: [PATCH][UBI] remove __exit on functions referenced in '.text'
	or '.init.text'
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: bene@linutronix.de
In-Reply-To: <39678.212.184.22.162.1169809215.squirrel@www.tglx.de>
References: <20070122230954.1b7f77e6.b.spranger@linutronix.de>
	<1169656229.3609.4.camel@sauron>
	<39678.212.184.22.162.1169809215.squirrel@www.tglx.de>
Content-Type: text/plain
Date: Fri, 26 Jan 2007 05:39:52 -0600
Message-Id: <1169811593.4198.1.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Benedikt Spranger <b.spranger@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-01-26 at 12:00 +0100, bene@linutronix.de wrote:
> Hi Artem,
> 
> > Yeah, I was actually planning to do the same and get rid of most
> > __init/__exit. But still out of curiosity, may you please elaborate on
> > the problem?
> 
> The Problem is simple: the kernel does not link. The linker reports the
> cross section references as errors. Here is an example:
> 
> `ubi_sysfs_vol_close' referenced in section `.text' of drivers/built-in.o:
> defined in discarded section `.exit.text' of
> drivers/built-in.o`ubi_sysfs_vol_close' referenced in section `.text' of
> drivers/built-in.o: defined in discarded section `.exit.text' of
> drivers/built-in.o`ubi_sysfs_vol_close' referenced in section `.text' of
> drivers/built-in.o: defined in discarded section `.exit.text' of
> drivers/built-in.o`ubi_sysfs_close' referenced in section `.text' of
> drivers/built-in.o: defined in discarded section `.exit.text' of
> drivers/built-in.o`ubi_sysfs_close' referenced in section `.init.text' of
> drivers/built-in.o: defined in discarded section `.exit.text' of
> drivers/built-in.o
> 

What version of GCC is this with?  And do you have UBI debug enabled?
As I said before, I can't recreate this on my system.

josh
