Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9NVY-0007VF-AQ
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 19:42:33 +0000
Received: by wwb34 with SMTP id 34so1315010wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Oct 2010 12:42:30 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <20101022155416.GA18595@kroah.com>
References: <1282974300-11664-1-git-send-email-vapier@gentoo.org>
	<AANLkTiktR-zNsv4KrnOBh3PxXZTHa6UypzqnwSBpE1=R@mail.gmail.com>
	<20101022155416.GA18595@kroah.com>
From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 22 Oct 2010 15:42:09 -0400
Message-ID: <AANLkTinCXAw8JU3mjtWmLU8_JqmwXsyJ-6JS=_=5T9JY@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [stable] [PATCH] mtd: Blackfin NFC: fix
	build error after nand_scan_ident() change
To: Greg KH <greg@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org,
	stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 22, 2010 at 11:54, Greg KH wrote:
> On Sat, Oct 16, 2010 at 05:14:53AM -0400, Mike Frysinger wrote:
>> stable team: could you pick this up for 2.6.35.x ?
>>
>> it has been merged in mainline as eac15a429a27cb74115daaf4c1127c5e854d50=
e4
>
> But it doesn't apply at all to .35-stable. =C2=A0There is no call to
> nand_scan_ident() in that file in the .35 tree.
>
> So, no, sorry, I can't apply it :)

then the patch shouldnt be necessary and 2.6.35.x is OK.  sorry for the noi=
se.
-mike
