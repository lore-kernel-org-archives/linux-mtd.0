Received: from mail.com1.fr ([62.161.40.252])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15dokK-0006zF-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2001 09:06:16 +0100
From: "Michel Stempin" <mstempin@com1.fr>
To: "Veikko Werner" <veikko.werner@logware.de>,
        <linux-mtd@lists.infradead.org>
Subject: RE: DOC2000 Boot de-ja-vue - add... 
Date: Mon, 3 Sep 2001 10:16:55 +0200
Message-ID: <NEBBLPFMELCDALFMOJILIECGCHAA.mstempin@com1.fr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <71B37AB6576DD211AB7E008048CD4D319FA655@exchange.ten.logware.de>
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

Hi Veikko,

It looks like you don't have /lib/libc-2.2.2.so, only the link to it
(libc.so.6 -> libc-2.2.2.so). It seems that you are missing all the
libraries, except libpam_misc.a, libpwdb.a and libtermcap.so.2.0.8.

The message "no init found", really means that "one of the components
required to run init is missing", which includes init itself, but also all
the dynamic libraries, if init is not statically linked.

--
Michel Stempin
MIS
COM One SA
11, parc de Marticot
33610, CESTAS, FRANCE
Tel: +33 (0)5 57 97 72 72
Fax: +33 (0)5 56 78 84 78
Mail: mstempin@com1.fr


> -----Message d'origine-----
> De : linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]De la part de Veikko Werner
> Envoyé : lundi 3 septembre 2001 09:26
> À : 'linux-mtd@lists.infradead.org '
> Objet : AW: DOC2000 Boot de-ja-vue - add...
>
>
>
> Thanks David,
>
> that was a good hint.
> After I mount /dev/nftla1 I can do /mnt/nftla1/sbin/init , sh, bash ...
> but if I use # chroot /mnt/nftla1 /sbin/init
> I get 'chroot: can not execute /sbin/init: No such file or directory'
>
> okay now I know there's a problem. But I've no idea how to solve it.
> I attach a listing of my root-fs. maybe one can see an error.
>
> Veikko
>
> -----Originalnachricht-----
> Von: David Woodhouse
> An: Veikko Werner
> Cc: linux-mtd@lists.infradead.org
> Gesendet: 31.08.01 17:41
> Betreff: Re: DOC2000 Boot de-ja-vue - add...
>
>
> veikko.werner@logware.de said:
> > conclusion:  MTD and NFTL load successfully kernels says "root
> > mounted" so I should must have the files I have when I mount it from
> > HD but that seems to be not right maybe access to the DOC is to slow?
> > Can I pass some arguments for slowing down ?
>
> Boot from the hard drive and check you can run /sbin/init and /bin/sh
> from the DiskOnChip:
>
>  mount /dev/nftla1 /mnt
>  chroot /mnt /bin/sh
>
>
> --
> dwmw2
>
>
>
