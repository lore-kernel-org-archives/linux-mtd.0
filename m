Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jokP-0000xs-6q
	for <linux-mtd@lists.infradead.org>; Tue, 05 Aug 2003 00:28:13 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HJ400IRFBU0OM@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 05 Aug 2003 01:27:36 +0200 (MEST)
Date: Tue, 05 Aug 2003 02:23:55 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <m3oez59tv7.fsf@bfnet.com>
To: David Wuertele <dave-gnus@bfnet.com>, linux-mtd@lists.infradead.org
Message-id: <200308050223.55088.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <m3ispeb4cp.fsf@bfnet.com> <200308041040.11475.tglx@linutronix.de>
 <m3oez59tv7.fsf@bfnet.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: zlib patch doesn't take?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 04 August 2003 20:10, David Wuertele wrote:
> Thomas> zlib.h is obviously not updated.
> Thomas> Can you provide the output of ./patchin.sh ?
>
> $ ./patchin.sh -c -j ~/C/perforce/source/deschutes/kernel/metro-X225-M14.0
> Patching /home/dave/C/perforce/source/deschutes/kernel/metro-X225-M14.0
> Include Filesytems: yes
> Zlib-Patch needed: yes
> Method: Copy
> Can we start now ? [y/N]y

Have you tried to use link method ?

In which directory does the error occure ? In lib/... there is no zlib.c.
I assume something does not get updated properly. Maybe Makefile in fs/jffs2.
Before the zlib patch, there was a file zlib.c in fs/jffs2 and it is still 
there if you have a 2.4.18 kernel.

Can you please check, if all files from mtd/fs/jffs2 are copied into 
linux/fs/jffs2 ?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
