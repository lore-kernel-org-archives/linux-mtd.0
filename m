Received: from mail-qy0-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MVJhK-0001i1-0U
	for linux-mtd@lists.infradead.org; Mon, 27 Jul 2009 06:28:38 +0000
Received: by qyk6 with SMTP id 6so3724137qyk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jul 2009 23:28:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090724123750.GA25563@mail.gnudd.com>
References: <cover.1248434635.git.rubini@unipv.it>
	<ce9ab5790907240510y752885b9m2debac82bbdd7401@mail.gmail.com>
	<20090724123750.GA25563@mail.gnudd.com>
Date: Mon, 27 Jul 2009 11:58:32 +0530
Message-ID: <ce9ab5790907262328w24946e69wbb2c7977a93aa982@mail.gmail.com>
Subject: Re: [PATCH V5 1/2] Nand driver for Nomadik 8815 SoC (on NHK8815
	board)
From: vimal singh <vimal.newwork@gmail.com>
To: Alessandro Rubini <rubini-list@gnudd.com>, vimal.newwork@gmail.com,
	linux-mtd@lists.infradead.org, andrea.gallo@stericsson.com,
	STEricsson_nomadik_linux@list.st.com, linux@arm.linux.org.uk
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 24, 2009 at 6:07 PM, Alessandro Rubini<rubini-list@gnudd.com> w=
rote:
>> Please run ''checkpatch.pl' for this patch and try to fix the errors.
>
> Ok, will do. Although I don't agree with everything checkpatch is
> saying (I've heard checkpatch is meant as suggestions, to be
> considered but not applied blindly, so I behaved accordingly).
>
>> this can be 'NAND_ECC_SOFT' here... then
>
> As explained in the comments above, there is the hardware in there,
> only I've not been able to use it yet. So I prefer to stay HW and then
> change as little as possible. =A0But, unless you confirm I can do that,
> I'll write SOFT in there as requested.

As of now, I think you can make it 'NAND_ECC_SOFT'. And then once you
are able to use HW ECC, you can change it back.
Currently making it HW confuses with wrong API being used in
'nand_base.c' (uses nand_'read/write'_page_hwecc rather than
nand_read/write_page_swecc routines), although it does not make much
difference in functionality.

Regards,
vimal

>
> Will repost on monday, I'm off for the weekend.
>
> /alessandro
>
