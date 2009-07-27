Received: from qw-out-1920.google.com ([74.125.92.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MVLqN-0004WV-Ce
	for linux-mtd@lists.infradead.org; Mon, 27 Jul 2009 08:46:08 +0000
Received: by qw-out-1920.google.com with SMTP id 5so1858382qwf.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jul 2009 01:46:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ce9ab5790907262328w24946e69wbb2c7977a93aa982@mail.gmail.com>
References: <cover.1248434635.git.rubini@unipv.it>
	<ce9ab5790907240510y752885b9m2debac82bbdd7401@mail.gmail.com>
	<20090724123750.GA25563@mail.gnudd.com>
	<ce9ab5790907262328w24946e69wbb2c7977a93aa982@mail.gmail.com>
Date: Mon, 27 Jul 2009 14:16:01 +0530
Message-ID: <ce9ab5790907270146q6c113aa0qdfee50dea2cf9f2b@mail.gmail.com>
Subject: Re: [PATCH V5 1/2] Nand driver for Nomadik 8815 SoC (on NHK8815
	board)
From: vimal singh <vimal.newwork@gmail.com>
To: Alessandro Rubini <rubini-list@gnudd.com>, linux-mtd@lists.infradead.org,
	andrea.gallo@stericsson.com, STEricsson_nomadik_linux@list.st.com,
	linux@arm.linux.org.uk
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 27, 2009 at 11:58 AM, vimal singh<vimal.newwork@gmail.com> wrot=
e:
> On Fri, Jul 24, 2009 at 6:07 PM, Alessandro Rubini<rubini-list@gnudd.com>=
 wrote:
>>> Please run ''checkpatch.pl' for this patch and try to fix the errors.
>>
>> Ok, will do. Although I don't agree with everything checkpatch is
>> saying (I've heard checkpatch is meant as suggestions, to be
>> considered but not applied blindly, so I behaved accordingly).
>>
>>> this can be 'NAND_ECC_SOFT' here... then
>>
>> As explained in the comments above, there is the hardware in there,
>> only I've not been able to use it yet. So I prefer to stay HW and then
>> change as little as possible. =A0But, unless you confirm I can do that,
>> I'll write SOFT in there as requested.
>
> As of now, I think you can make it 'NAND_ECC_SOFT'. And then once you
> are able to use HW ECC, you can change it back.
> Currently making it HW confuses with wrong API being used in
> 'nand_base.c' (uses nand_'read/write'_page_hwecc rather than
> nand_read/write_page_swecc routines), although it does not make much
> difference in functionality.
>
To make it work for 512 bytes sector ECC in SW, below patch is required:

http://patchwork.ozlabs.org/patch/13697/

Which was posted sometime back, but unfortunately did not get merged.

David,

Can we get this patch merged? If required, I will post updated patch
after re-basing.

-vimal

>>
>> Will repost on monday, I'm off for the weekend.
>>
>> /alessandro
>>
>



--=20
---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
