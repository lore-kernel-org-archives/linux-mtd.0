Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O98gf-0008BM-HB
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 03:20:49 +0000
Received: by wyg36 with SMTP id 36so1762638wyg.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 May 2010 20:20:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1272888512.27729.46.camel@localhost>
References: <a145ef951003110433k5fd6c3c0h23bbe73fdb39686f@mail.gmail.com>
	<531B6536C9F737458807DF75064873C8BE5EB0382D@mta-digimail.MTA.INT>
	<a145ef951003160113x7baea205i8deb13c14ba8e0de@mail.gmail.com>
	<1270544458.6754.15.camel@localhost>
	<r2va145ef951005030454ud5400ebao9ce886d0e86c7549@mail.gmail.com>
	<1272888512.27729.46.camel@localhost>
Date: Tue, 4 May 2010 11:20:43 +0800
Message-ID: <i2sa145ef951005032020i17584946r95957f8a038efe23@mail.gmail.com>
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

Dear all,

I find the root cause: bootloader

UBI image, written by bootloader, could not be mount.
UBI image, written by ubiformat command, could be mount correctly.

I guess that bootloader may not write ubi image correctly.
I will port ubiformat in bootloader.

Thank you,
Best regards,

2010/5/3 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2010-05-03 at 19:54 +0800, =C1=D6=D3=DA=BE=FE wrote:
>> Dear all,
>>
>> Thank you for your support.
>> I can mount UBIFS now after fixing mtd read function.
>>
>> However, if I enable the "extra checks" of UBI and UBIFS, then I can
>> not mount UBIFS.
>> What's the different after enable "extra checks" of UBI and UBIFS.
>
> Well, these are various self-checks. There are many of them and they are
> different. E.g., in UBI some of them read flash before every writing and
> make sure the area contains all 0xFF bytes. In UBIFS this can be walking
> through the whole index tree and checks it. There are many of them and
> they are different.
>
> If things stop working for you when you enable all checks, this either
> means a bug in the debugging code or a real problem. Please, post your
> error report. Use this guide:
>
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
>
> --
> Best Regards,
> Artem Bityutskiy (=A7=A1=A7=E2=A7=E4=A7=D7=A7=DE =A7=A2=A7=DA=A7=E4=A7=F0=
=A7=E8=A7=DC=A7=DA=A7=DB)
>
>
