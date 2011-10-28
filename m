Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RJkV8-0004rh-5b
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 11:21:31 +0000
Received: by gyd10 with SMTP id 10so4030647gyd.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Oct 2011 04:21:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4EAA8E51.301@st.com>
References: <CAAwP0s059H3BGhYbYLux2gR6ZNb+sFDue676OM2Evz5cA2q6DA@mail.gmail.com>
	<0A40042D85E7C84DB443060EC44B3FD33254FA3BBC@dekaexchange07.deka.local>
	<4EAA8E51.301@st.com>
From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 28 Oct 2011 13:21:07 +0200
Message-ID: <CAAwP0s15JaqZRNkHT6UJaiHrWGka14SfXCsuqMB7aKCtFrRsdw@mail.gmail.com>
Subject: Re: [RFC] Change ECC algorithm from userspace
To: Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, aschmidt@dekaresearch.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 28, 2011 at 1:13 PM, Angus CLARK <angus.clark@st.com> wrote:
> Hi Javier, Atlant,
>

Hi Angus,

> NAND Flash, coupled with an appropriate ECC scheme, is every bit (excuse =
the
> pun!) reliable as NOR Flash (which typically does not employ any ECC).
>
> Many of the current SLC devices that recommend 4-bit ECC, also guarantee =
block
> zero to be good with 1-bit ECC, allowing the part to be used with existin=
g 1-bit
> Hamming ECC boot-loaders. =C2=A0However, this is only valid if your boot-=
code can fit
> into 1 block.
>

Yes, in fact the NAND that we are using guarantee that the first block
can be reliable with 1-bit ECC if it written less than an threshold
value.
That is why I think we can use this NAND for boot.

> We also faced a similar issue in the past, requiring different ECC scheme=
s for
> the boot code and for the remainder of the Flash. =C2=A0Our approach was =
based on MTD
> partitions - each partition could have different ECC scheme, with the res=
pective
> 'nand_ecc_ctrl' structures swapped in and out as necessary.
>

What is wasn't clear for me was if I could do it from user-space or if
I had to modify the OMAP NAND driver to switch the layouts and and ECC
scheme for each partition.

> However, as suggested by others, computing the ECC in software, and using=
 raw
> programming is much simpler!
>
> Cheers,

Yes, I think we should also use that approach. It seems simpler and
less intrusive than changing the driver.

Thanks a lot to everyone for the help!

Best regards,

--=20
Javier Mart=C3=ADnez Canillas
(+34) 682 39 81 69
Barcelona, Spain
