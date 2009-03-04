Received: from rv-out-0708.google.com ([209.85.198.247])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lf0np-00079v-2L
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 23:47:07 +0000
Received: by rv-out-0708.google.com with SMTP id k29so3449200rvb.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Mar 2009 15:47:03 -0800 (PST)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <20090304085055.c9de6cbb.akpm@linux-foundation.org>
References: <20090303063605.GA30258@july>
	<20090303124948.dda294e5.akpm@linux-foundation.org>
	<49AE6907.1080702@nokia.com>
	<20090304085055.c9de6cbb.akpm@linux-foundation.org>
Date: Thu, 5 Mar 2009 08:47:03 +0900
Message-ID: <9c9fda240903041547x540899f9hd94cbf49baac660b@mail.gmail.com>
Subject: Re: [PATCH 1/3] [MTD] Flex-OneNAND support
From: Kyungmin Park <kmpark@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Rohit Hagargundgi <h.rohit@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, Mar 5, 2009 at 1:50 AM, Andrew Morton <akpm@linux-foundation.org> w=
rote:
> On Wed, 04 Mar 2009 13:41:59 +0200 Adrian Hunter <adrian.hunter@nokia.com=
> wrote:
>
>> Andrew Morton wrote:
>> >> ...
>> >>
>> >> +static loff_t flexonenand_get_addr(struct onenand_chip *this, int bl=
ock)
>> >> +{
>> >> + =A0loff_t ofs =3D 0;
>> >> + =A0int die =3D 0, boundary;
>> >> +
>> >> + =A0if (ONENAND_IS_DDP(this) && block >=3D this->density_mask) {
>> >> + =A0 =A0 =A0 =A0 =A0block -=3D this->density_mask;
>> >> + =A0 =A0 =A0 =A0 =A0die =3D 1;
>> >> + =A0 =A0 =A0 =A0 =A0ofs =3D this->diesize[0];
>> >> + =A0}
>> >> +
>> >> + =A0boundary =3D this->boundary[die];
>> >> + =A0ofs +=3D block << (this->erase_shift - 1);
>> >> + =A0if (block > (boundary + 1))
>> >> + =A0 =A0 =A0 =A0 =A0ofs +=3D (block - boundary - 1) << (this->erase_=
shift - 1);
>> >
>> > Both `block' and `boundary' have 32-bit types. =A0Are you sure that th=
e
>> > left-shift cannot overflow?
>>
>> Only very recently has MTD supported sizes greater than 32 bits internal=
ly
>> for any type of flash. =A0The external APIs (ioctls) are still 32-bit ba=
sed.
>>
>> For this driver, supporting sizes over 32-bits is a separate issue - and
>> may never be needed.
>
> So it doesn't support files >4G? =A0What's the max device size (now and
> projected)?

Umm it's not simple question. basically Flex-OneNAND based on NAND
flash technology. It means if NAND flash technology are advanced, it
can also get more size. Currently max Flex-OneNAND has 16 Gib (2GiB)
So it will be exceed the 4GiB soon. but I'm not sure when this device is op=
ened.
I think we know the issues currently and then if the device is opened,
handle this one if required.
How do you think?

Thank you,
Kyungmin Park
