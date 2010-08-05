Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh2FK-0007rJ-Qw
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:20:43 +0000
Received: by wyf19 with SMTP id 19so3612162wyf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 08:20:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1281021362.8720.6.camel@localhost>
References: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
	<1281020864-26842-4-git-send-email-vapier@gentoo.org>
	<1281021362.8720.6.camel@localhost>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 5 Aug 2010 11:20:16 -0400
Message-ID: <AANLkTingjY9sYcTnJ_dmp1NWyBjqv2Rv-U3JcVaFJhop@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [PATCH 4/7] mtd: Blackfin NFC: wait for the
	ECC reset to finish
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org,
	Barry Song <barry.song@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 5, 2010 at 11:16, David Woodhouse wrote:
> On Thu, 2010-08-05 at 11:07 -0400, Mike Frysinger wrote:
>>
>> + =C2=A0 =C2=A0 =C2=A0 while (bfin_read_NFC_RST() & ECC_RST)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_relax();
>
> All applied, but I'd be happier if this one had some kind of timeout and
> didn't have the potential to loop forever if the hardware misbehaves.

ive opened a tracker item for it
-mike
