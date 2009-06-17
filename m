Received: from wa-out-1112.google.com ([209.85.146.180])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MGuJN-0000gB-OO
	for linux-mtd@lists.infradead.org; Wed, 17 Jun 2009 12:32:23 +0000
Received: by wa-out-1112.google.com with SMTP id j5so74217wah.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Jun 2009 05:32:16 -0700 (PDT)
References: <d16af8a00906170053p11a4f0e3vd0bbef99d65b9aac@mail.gmail.com>
	<1245227364.9487.7.camel@localhost.localdomain>
Message-Id: <53BEC22A-BFC7-42FD-A66E-81D52CF1F5BA@gmail.com>
From: Ivan <ivanming@gmail.com>
To: "dedekind@infradead.org" <dedekind@infradead.org>
In-Reply-To: <1245227364.9487.7.camel@localhost.localdomain>
Content-Type: text/plain;
	charset=big5-hkscs;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (iPhone Mail 5H11)
Subject: Re: how to implement prepare_write, commit_write for ubifs
Date: Wed, 17 Jun 2009 20:24:42 +0800
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thankyou very much for the information!


Sent from my iPhone

On 2009=A6~6=A4=EB17=A4=E9, at 16:29, Artem Bityutskiy =
<dedekind@infradead.org> =20
wrote:

> On Wed, 2009-06-17 at 15:53 +0800, Ivan Chan wrote:
>> Hi all,
>>
>> I am porting UBIFS/UBI to 2.6.4 kernel, however, 2.6.4 kernel =20
>> requires
>> prepare_write, commit_write in address_space_operations (defined in
>> include/linux/fs.h),
>> but it is no longer exists in 2.6.2x kernel.
>>
>> How can I rewrite these function for 2.6.4 kernel?
>>
>> In 2.6.2x, there is similar function write_begin, and write_end, but
>> the API requires
>> struct address_space *mapping,  struct page **pagep, void **fsdata,
>>
>> Is that possible and how to provide this argument in 2.6.4 kernel?
>
> ATM we support UBIFS back-ports from v2.6.24 to v2.6.30.
>
> The change of the address space operation happened between 2.6.23 and
> 2.6.24.
>
> In the paste, we also supported UBIFS back-ports for kerneld
> 2.6.21-2.6.23. But then we dropped them because it became increasingly
> difficult to back-port stuff there.
>
> So what would suggest you do is:
>
> a). Start with the old and unsupported 2.6.23 UBIFS back-port which =20=

> you
> may find here: git://git.infradead.org/users/dedekind/ubifs-=20
> v2.6.23.git
>
> b). Back-port this UBIFS 2.6.23 stuff to your ancient 2.6.4, it should
> be easier to do comparing to back-porting the newest stuff.
>
> c). Back port the rest of the UBIFS changes/fixes from the latest
> kernels, e.g., from the UBIFS 2.6.30 back-port.
>
> The back-ports URLS may be found here:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source
>
> Or just see here:
> http://git.infradead.org/
>
> --=20
> Best regards,
> Artem Bityutskiy (=C7=F4=C8^=C8h=C8t=C8l=C8`=C8^=C8_ =C7=F3=C8f=C8h=C8[=C8=
b)
>
