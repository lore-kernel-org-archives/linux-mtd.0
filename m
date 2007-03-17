Received: from nf-out-0910.google.com ([64.233.182.184])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HSYEo-0007iY-DD
	for linux-mtd@lists.infradead.org; Sat, 17 Mar 2007 08:42:25 -0400
Received: by nf-out-0910.google.com with SMTP id h2so496220nfe
	for <linux-mtd@lists.infradead.org>;
	Sat, 17 Mar 2007 05:42:20 -0700 (PDT)
Message-ID: <625fc13d0703170542t2ccd0db4p71c62760874d7829@mail.gmail.com>
Date: Sat, 17 Mar 2007 07:42:20 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Tian Jin" <tad2k@msn.com>
Subject: Re: how can I use MTD partition with large size ( >= 4G bytes)?
In-Reply-To: <BAY107-F20DDEF29A5BA389380A768ED700@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <BAY107-F20DDEF29A5BA389380A768ED700@phx.gbl>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/17/07, Tian Jin <tad2k@msn.com> wrote:
> Hi, I want to use NAND flash chips to storage large audio data, the max
> storage size will be 3.6G bytes=A3=A8may be 7G bytes in the future=A3(c),=
 so I have
> to use four 1GB NAND flash chips to make up a single 4GB MTD partition, b=
ut
> mtd->size was defined as 32bit integer in MTD driver(linux-2.6.20-rc1), s=
o
> mtd->size just overflowed in function nand_scan_ident():
>
> /* Store the number of chips and calc total size for mtd */
> chip->numchips =3D i;
> mtd->size =3D i * chip->chipsize; // 4 * 40000000 =3D 0x100000000 =3D 0xF=
FFFFFFF +
> 0x01
>
> I've tried to modify the data type of mtd->size to usinged long long, but
> kernel can not be compiled successfully=A3=ACIs there any solution for th=
is?

Not at the moment.  MTD doesn't support things greater than 4GiB.

josh
