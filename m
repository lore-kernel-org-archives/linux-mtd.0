Received: from ultra.secret.org.uk ([194.154.178.202] helo=ultra)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168yEg-0005tS-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Nov 2001 06:30:22 +0000
Message-ID: <006d01c177d7$ee329190$0100a8c0@secret.org.uk>
From: "Si" <spse@secret.org.uk>
To: "Michael Rothwell" <rothwell@holly-springs.nc.us>,
	<spse@secret.org.uk>
Cc: <linux-mtd@lists.infradead.org>
References: <1006918956.9840.2.camel@gromit.house> <1006921285.9892.6.camel@gromit.house>
Subject: Re: Using JFFS2 as root FS on CF
Date: Wed, 28 Nov 2001 06:42:58 -0000
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

Michael,

the latest blkmtd in CVS should fix the problem when compiled into the
kernel. you can then pass the kernel boot param
blkmtd_device=/dev/foo

Note, this version isnt yet it the latest kernel sources, but you should
just be able to get the one out of CVS and copy it
over the blkmtd.c in the kernel source tree.

I will hopefully send a patch off to the 2.4 maintainer later this week, I
didnt bother earlier as I assumed with the 2.4/2.5 change over,  Linus and
Marcelo probably had more important bug fixes etc to deal with.

cheers
si
----- Original Message -----
From: "Michael Rothwell" <rothwell@holly-springs.nc.us>
To: "Michael Rothwell" <rothwell@holly-springs.nc.us>
Cc: <linux-mtd@lists.infradead.org>
Sent: Wednesday, November 28, 2001 4:21 AM
Subject: Re: Using JFFS2 as root FS on CF


> On Tue, 2001-11-27 at 22:42, Michael Rothwell wrote:
> > Does someone have a recipe for booting a kernel (2.4.13 or 2.4.16) with
> > this type of setup and having it mount the jffs2 fs as /?
>
>
> Addendum: blkmtd complains "error, missing 'device' name" -- I'm passing
> it in via lilo, but it looks like blkmtd doesn't read kernel arguments.
>
> -M
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
