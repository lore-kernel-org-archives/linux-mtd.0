Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OC0aP-0004wO-D8
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 01:18:10 +0000
Received: by wwb22 with SMTP id 22so3119356wwb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 May 2010 18:18:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1273556690.2209.146.camel@localhost>
References: <a145ef951003110433k5fd6c3c0h23bbe73fdb39686f@mail.gmail.com>
	<531B6536C9F737458807DF75064873C8BE5EB0382D@mta-digimail.MTA.INT>
	<a145ef951003160113x7baea205i8deb13c14ba8e0de@mail.gmail.com>
	<1270544458.6754.15.camel@localhost>
	<r2va145ef951005030454ud5400ebao9ce886d0e86c7549@mail.gmail.com>
	<1272888512.27729.46.camel@localhost>
	<i2sa145ef951005032020i17584946r95957f8a038efe23@mail.gmail.com>
	<AANLkTil-IPNGJdudKOjtHjc9Y2od0xM2-D7beVEV_HHI@mail.gmail.com>
	<1273556690.2209.146.camel@localhost>
Date: Wed, 12 May 2010 09:18:05 +0800
Message-ID: <AANLkTilpKdU3IrnoLCLnCqiW_E9a2VbyyREVoTpVRk-F@mail.gmail.com>
Subject: Re: Can not mount UBIFS
From: =?Big5?B?qkykX65t?= <okpalin@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Bosi Daniele <Daniele.Bosi@mta.it>,
	GUIDA Nicola <Nicola.GUIDA@numonyx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Sir,

I am very confused.
If the driver has some problems, why images written by ubiformat can work w=
ell?
Images written by bootloader or ubiformat should have the same
problem, if the driver is wrong.

Thank you,
Best regards,

2010/5/11 Artem Bityutskiy <dedekind1@gmail.com>:
> On Tue, 2010-05-11 at 11:46 +0800, =C1=D6=D3=DA=BE=FE wrote:
>> Dear all,
>>
>> I have modified bootloader to download image as ubiformat does.
>> However, I still can not mount it.
>> I also dump the content of mtd partition and compare.
>> (Ex: dd if=3D/dev/block/mtdblock5 of=3D/data/mtd5bak)
>> No difference between the content written by bootloader and written by
>> ubiformat.
>>
> ... snip ...
>
>> <3>UBI error: ubi_io_read: error -22 while reading 2048 bytes from PEB
>> 3:6144, read 0 bytes
>
> Well, find out why your driver returns -EINVAL and read count 0 when you
> read 2048 bytes from PEB 3 on this partition, and offset 6144. Dig the
> driver.
>
> --
> Best Regards,
> Artem Bityutskiy (=A7=A1=A7=E2=A7=E4=A7=D7=A7=DE =A7=A2=A7=DA=A7=E4=A7=F0=
=A7=E8=A7=DC=A7=DA=A7=DB)
>
>
