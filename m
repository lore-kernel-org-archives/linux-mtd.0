Received: from vistatopology.com ([61.218.47.235])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U55G-0007S0-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 12:31:40 +0100
Message-ID: <001401c11f34$dc14ddc0$110aa8c0@vistatopology.com>
From: "Alex Liao" <alex@vistatopology.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Juan Ramon Jimenez Garcia" <juan@hispafuentes.com>
Cc: <linux-mtd@lists.infradead.org>, <olea@hispafuentes.com>
References: <3B67E336.B7925626@hispafuentes.com>  <523.997177701@redhat.com>
Subject: Problems compiling kernel 2.2.1-rmk2
Date: Tue, 7 Aug 2001 19:34:03 +0800
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

Hi all,
        I have problems about compiling MTD with kernel 2.2.1-rmk2(patched
arm-patch files).
        I used AMD flash chip (support CFI ) .
        Error message:
        cfi_cmdset_0002.c: In function 'do_read_onechip':
        cfi_cmdset_0002.c:206: dereferencing pointer to incomplete type
        cfi_cmdset_0002.c:208: dereferencing pointer to incomplete type
        cfi_cmdset_0002.c:209: dereferencing pointer to incomplete type

                    ....... so many error msg like above.......
        Could anyone give me help or suggestions to resolve the problems ?

Thanks

----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Juan Ramon Jimenez Garcia" <juan@hispafuentes.com>
Cc: <linux-mtd@lists.infradead.org>; <olea@hispafuentes.com>
Sent: Tuesday, August 07, 2001 5:48 PM
Subject: Re: Problems compiling kernel 2.2.17


>
>
> juan@hispafuentes.com said:
> >  but now we got another link error with an undefined reference to
> > 'init_nftl'
>
> init_nftl was declared 'static' because that works in 2.4 and I don't
often
> test with 2.2 kernels before 2.2.18 (where it also works because the 2.4
> initcall stuff has been merged). I've now fixed it in v1.77 of nftlcore.c.
>
> > How can we solved this? Do you think we must to configure
> > something special to get the kernel image?
>
> Using 2.2.18 would help - it does the initcall stuff in the new way.
> Otherwise, it ought to work, it's mostly just details like the above which
I
> won't have noticed.
>
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
