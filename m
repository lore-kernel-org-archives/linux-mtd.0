Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18I1uA-0003xv-00
	for <linux-mtd@lists.infradead.org>; Sat, 30 Nov 2002 07:19:10 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6D004CIPPZXE@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sat, 30 Nov 2002 08:49:12 +0100 (MET)
Date: Sat, 30 Nov 2002 08:47:02 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: undefined reference to 'crc32' ?
In-reply-to: <3DE7CB23.5535F5E6@imc-berlin.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200211300847.02340.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <3DE7CB23.5535F5E6@imc-berlin.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Friday 29 November 2002 21:16, Steven Scholz wrote:
> Hi there,
>
> I am using linux 2.4.20 on a powerpc platform.
>
> I just pulled the recent CVS, run patchin.sh on it and tried to build a new
> kernel image.
> But I get load of these:
patchin.sh was overhauled. Did you use patchin.sh with the -j option to 
include jffs(2) filesystems ?

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
