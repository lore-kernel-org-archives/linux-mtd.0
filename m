Received: from ultra.secret.org.uk ([194.154.178.202] helo=ultra)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15xovS-0004xm-00
	for <linux-mtd@lists.infradead.org>; Sun, 28 Oct 2001 12:20:27 +0000
Message-ID: <001001c15fae$4f966890$fb497ad5@smooth>
From: "Si" <spse@secret.org.uk>
To: "W . Suika Roberts" <ssfr@unm.edu>,
	<linux-mtd@lists.infradead.org>
References: <20011027003752.E16430@misa.genom.co.jp>
Subject: Re: blkmtd command line specification?
Date: Sun, 28 Oct 2001 12:43:18 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi,

the problem is that it doesnt handle kernel boot params as I didnt know they
were handled seperately to module loading parameters. Im fixing it now ;)

cheers
si
----- Original Message -----
From: "W . Suika Roberts" <ssfr@unm.edu>
To: <linux-mtd@lists.infradead.org>
Sent: Saturday, October 27, 2001 6:37 AM
Subject: blkmtd command line specification?


> I'm working on getting a jffs2 root file system running on my new Ipaq
IA-1.
>
> I can use blkmtd when it is built as a module, but I can't seem to figure
out
> the coomand-line syntax for using it built into the kernel.
>
> So, how do I specify what to do on the command line?
> I tried
> blkmtd=device:/dev/hda2
> and
> blkmtd=device=/dev/hda2
> but neither worked.
>
> As a module:
> insmod blkmtd.o device=/dev/hda2
> works just fine.
>
> 2.4.13, no patches, i386.
>
> Thanks,
> Suika
> --
> ssfr@unm.edu
> If the code and the comments disagree, then both are probably wrong.
>                 -- Norm Schryer
>    <a href="http://www.unm.edu/~ssfr/">Suika no homepage</a>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
