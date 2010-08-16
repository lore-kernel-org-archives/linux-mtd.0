Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OkpqD-0008BN-Iy
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 02:54:26 +0000
Received: by gyf2 with SMTP id 2so2105166gyf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 15 Aug 2010 19:54:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1281021362.8720.6.camel@localhost>
References: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
	<1281020864-26842-4-git-send-email-vapier@gentoo.org>
	<1281021362.8720.6.camel@localhost>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 16 Aug 2010 10:54:04 +0800
Message-ID: <AANLkTi=7YJ1_Wd499WTVfmpvqxdysROCRHpekfkUyrDT@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [PATCH 4/7] mtd: Blackfin NFC: wait for the
	ECC reset to finish
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: uclinux-dist-devel@blackfin.uclinux.org, Mike Frysinger <vapier@gentoo.org>,
	linux-mtd@lists.infradead.org, Barry Song <barry.song@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 5, 2010 at 11:16 PM, David Woodhouse <dwmw2@infradead.org> wrot=
e:
> On Thu, 2010-08-05 at 11:07 -0400, Mike Frysinger wrote:
>>
>> + =C2=A0 =C2=A0 =C2=A0 while (bfin_read_NFC_RST() & ECC_RST)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_relax();
>
> All applied, but I'd be happier if this one had some kind of timeout and
> didn't have the potential to loop forever if the hardware misbehaves.
If this loop forever, it means a chip bug and really has no any way to
continue to run the system. So the point is "bfin_read_NFC_RST() &
ECC_RST" will must be real for the right chip, if the chip has bug,
there should be workaround but not a timeout.

>
> --
> David Woodhouse =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Open Source Technology Centre
> David.Woodhouse@intel.com =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Intel Corporatio=
n
>
>
> _______________________________________________
> Uclinux-dist-devel mailing list
> Uclinux-dist-devel@blackfin.uclinux.org
> https://blackfin.uclinux.org/mailman/listinfo/uclinux-dist-devel
>
