Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vpJ0-00053B-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 22:11:26 +0000
Received: from stonewall.shenandoah.com ([204.111.72.3] helo=mail.datalux.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 11vpIx-000535-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 22:11:23 +0000
Message-ID: <384ED6E8.59F54440@datalux.com>
Date: Wed, 08 Dec 1999 17:08:40 -0500
From: ralph stickley <ralph@datalux.com>
MIME-Version: 1.0
To: "Tkatchouk, Pavel" <PTkatchouk@squirrelsystems.com>
CC: "'linux-embedded@waste.org'" <linux-embedded@waste.org>,
 	MTD <mtd@imladris.mvhi.com>, Oron Ogdan <Orono@m-sys.com>
Subject: Re: Anyone embedding RH 6.1 / 2.2.12 ?
References: <9182AA6C8DACD311A8D70006294EF76808D3C1@exchange-yvr.squirrelsystems.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Yeah! M-Systems updated their linux drivers - seems like they
only changed their patch file for V2.2.0...

Boo ! - they still don't have a file listing for V2.2.0 :-(

>I was wondering if anyone has sucessfully "embedded" the 2.2.12 kernel
>from the RedHat 6.1 distro...
>2.0.36 worked fine but I am required to do an upgrade and there seems to
>be quite a few differences.

>I am looking for a list of files that will allow the system to boot
>(from M-Systems DOC) and run Fvwm2 (or similiar).   Also, a minimum
>kernel .config file would be useful :-)

>Currently, I can boot to the M-Systems chip as single user .  With a
>normal boot, the login prompt shows but does not allow anyone, even
>root, to login (I've copied the passwd, shadow, tons of library files
>and pam.d stuff, but still no luck).

>Our system is as follows:
>Media GX 233
>Touchscreen
>32MB ram
>AMI BIOS
>LCD panel
>M-Systems DOC 2000 - 16MB

>Any pointers or suggestions would be appreciated !
>Thanks,
>Ralph Stickley
>Datalux, Corp.

"Tkatchouk, Pavel" wrote:

> Unlikely your case, but here it goes...
> When I moved my diskless from libc to glibc login all of a sudden
> stopped to let anyone in. The problem appeared to be missing
> /lib/libnss_files.so.1,libnss_files.so.2,libnss_dns.so.2,
> libnss_nis.so.2,libresolv.so.2,libnsl.so.1 (not reported by ldd)
> and /etc/nsswitch.conf.
>

Seems like these libraries are required for passwd, maybe some of
the pam stuff...I copied these too..still no luck

I'd like to turn the pam stuff off anyhow...not sure how yet...

Is nsswitch.conf used during the login ?? Hmmmmm....


>
> Also, perhaps the following extract from my "Diskless-from-NT-mini-howto"
> (can be found in www.slug.org.au/etherboot distribution
> under name NT-Diskless-Terminal.txt) may be helpful in determining files
> required:
>
> "Pruning standard distribution (RedHat, Debian, etc.) to your needs might be
> very time
> consuming. To ease that painful process I have used remotely booted diskless
> client with
> NFS-Root (see Etherboot's Readme, NFS-Root and NFS-Root-Client mini-HOWTO's,
> Diskless-
> HOWTO):
>

If you have done this, do you have a directory listing available ? :-)
I have not used NFS stuff yet...not sure if I'll be able to figure this one
out.

> <snip>

> Regards,
>
> Pavel Tkatchouk
>

Thanks,
Ralph



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
