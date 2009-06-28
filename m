Received: from qw-out-1920.google.com ([74.125.92.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MKnna-000135-9f
	for linux-mtd@lists.infradead.org; Sun, 28 Jun 2009 06:23:40 +0000
Received: by qw-out-1920.google.com with SMTP id 5so1670462qwf.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 27 Jun 2009 23:23:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <D824A1DB59234D8A832B13B803B0B954@sisodomain.com>
References: <200906252128.08460.david-b@pacbell.net>
	<200906252256.16902.david-b@pacbell.net>
	<ce9ab5790906260422q136ed6e1p41593ece4b5fe319@mail.gmail.com>
	<200906261010.42073.david-b@pacbell.net>
	<D824A1DB59234D8A832B13B803B0B954@sisodomain.com>
Date: Sun, 28 Jun 2009 11:53:32 +0530
Message-ID: <ce9ab5790906272323h3a887acay5995641a4d14b777@mail.gmail.com>
Subject: Re: query: nand read/write method for 2048 + 64 byte page
From: vimal singh <vimal.newwork@gmail.com>
To: Amit Kumar Sharma <amitsharma.9@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Brownell <david-b@pacbell.net>,
	Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 27, 2009 at 10:47 AM, Amit Kumar
Sharma<amitsharma.9@samsung.com> wrote:
> Hi Vimal,
>
>> On Friday 26 June 2009, vimal singh wrote:
>>> The problem is that HW ECC engine in BCH mode dose not
>>> provide any
>>> possible configuration where we can keep ECC bytes in
>>> main area
>>> itself. OOB + ECC data has to be in only spare area.
>>
>> Healthy. =A0I disike that "infix OOB" myself. =A0It is however
>> a standard ECC mode in the NAND framework. =A0:(
>>
>> So you're asking about how to map hardware-specific
>> details
>> to the NAND framework? =A0That wasn't clear.

Yes, that's right.

> I think better you use some of the bytes of OOB area , In
> almoost al NAND you can read 2K page size or 4K page size
> additinal you have to read OOB or spare area of NAND.
>>
>>
>>> Would it not be the good idea to perform read/write for
>>> full (2112 bytes) page?
>>
>> I'm not sure I can answer that without reading up on that
>> particular NAND ECC engine.
>>
>> Recall however that the NAND framework will think in terms
>> of 2KB reads, with OOB data on the side. =A0There will be
>> separate reads for 2K and then 64 bytes.

The question is, how to involve 'main area bytes + OOB bytes (+ ECC
bytes, in case of reads)', while writing / reading a page to/from nand
device.

>>
>>
>>> And enable HW_ECC before read/write and then call for
>>> ecc.calculate or
>>> ecc.correct accordingly. Rest all things can be taken
>>> care by
>>> underlying controller driver.
> I donot think when Hw_ecc is enable some software ECC
> calculation is required.

You may need SW algo to correct the errors indicated by HW generated ECCs.

>>
>> Those sentences seem to elide critical parts of the
>> process.
>> Like the details of OOB and ECC handling, which seem to be
>> what you're not sure of...

OOB area details are part of filesystem used in question. But we
certainly have control over defining layout for OOB area, which then
can be used by any upper layer SW component.

>>
>>
>
> Thanks
> Amit
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>



--=20
---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
