Received: from mail.fst.it ([213.255.39.254] helo=fst.it)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19yofc-0005LA-Gb
	for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2003 09:25:16 +0100
Message-ID: <020901c37b62$b3ef9420$a970a8c0@topo>
From: "Luca Contini" <luca.contini@mediaenabling.com>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
References: <200309091012.22241.luca.contini@mediaenabling.com>
	<a05200f3ebb8347166dbf@[130.161.115.44]>
Date: Mon, 15 Sep 2003 10:23:55 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: MTD-Linux <linux-mtd@lists.infradead.org>
Subject: Re: missing function 'unlikely'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> At 10:12 +0200 09-09-2003, Luca Contini wrote:
> >Hi all,
> >I've downloaded the snapshot 2003-08-28 and I'm trying to use it with
kernel
> >2.4.18.
> >The mtdblock module is compiled with no problems but when i try to insert
it I
> >get this error:
> >'unresolved symbol unlikely'
> >I've done a grep on the entire kernel tree but with no result.
>
> Which version of gcc are you using ?
>
> unlikely() is an optimization hint to the compiler, telling it that
> the conditional statement in question is expected to be false.
>
> As a hack, you can disable it by including
>
> #define unlikely(x) (x)
>
> in the affected source files. I would suggest upgrading your tools,
though.

Hi,
thank you very much, I've successfully fixed the above problem... but there
is another one:

** mtd_blkdevs.o: unresolved symbol mtd_table_mutex **
** mtd_blkdevs.o: unresolved symbol mtd_table **

The mtdcore.c source should export those symbols... but there is no way to
insert mtd_blkdevs.o module without this error.
Any suggestion?


Luca

>
> HTH,
>
> JDB.
> -- 
> LART. 250 MIPS under one Watt. Free hardware design files.
> http://www.lart.tudelft.nl/
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
