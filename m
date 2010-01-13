Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUrHG-0000mJ-6z
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 00:40:07 +0000
Received: by ewy23 with SMTP id 23so48324ewy.4
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jan 2010 16:40:01 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <1263332234.3445.10.camel@localhost.localdomain>
References: <152584231001111056n2d174f8fmef6641c4fee99781@mail.gmail.com>
	<152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
	<1263271808.30988.38.camel@localhost.localdomain>
	<152584231001120407m6fc901edrd6584f55edc04341@mail.gmail.com>
	<1263332234.3445.10.camel@localhost.localdomain>
Date: Tue, 12 Jan 2010 19:40:00 -0500
Message-ID: <152584231001121640w8bb7bdx6cc4d0f9cc95c510@mail.gmail.com>
Subject: Re: Fail to mount ubifs
From: Jon Ringle <jon@ringle.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 12, 2010 at 4:37 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
>> >> Logical eraseblock size: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 130944 bytes=
, f KiB
>> >
>> > Hmm, this f KiB looks weird.
>>
>> Why is it weird? It is 128 bytes less than my PEB size of 0x20000.
>
> Because "f" is strange, I did not expect this.
> The print is:
> =A0 =A0 =A0 =A0printf("%s%.1f KiB", p, (double)bytes / 1024);
>
> see ubiutils_print_bytes() in mtd-utils/ubi-utils/src/common.c
>
> Not sure why it prints "f KiB" on your system.

Apparently the printf implementation in klibc does not support %f that
is used in
ubiutils_print_bytes()

Jon
