Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Otfho-0004RR-T2
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2010 11:54:17 +0000
Received: by iwn10 with SMTP id 10so1089856iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Sep 2010 04:54:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1284030609.27765.4.camel@localhost>
References: <AANLkTikScro_GmWvVb6SCq5wTzMAfN+c_4Od2SBY+OpO@mail.gmail.com>
	<1283846532.2979.0.camel@localhost>
	<AANLkTi=mrqg21uOXPJf=dOUq20YD1ocAZJpf1=fodtVM@mail.gmail.com>
	<1284019747.2979.73.camel@localhost>
	<AANLkTi=SGuBghcHnFoZfe6j3jVxQbKxzSU7t4z+vwPxc@mail.gmail.com>
	<1284030609.27765.4.camel@localhost>
Date: Thu, 9 Sep 2010 13:54:15 +0200
Message-ID: <AANLkTikhyEJn97McTOSYcAXG11EeqfpXzRUdRqY0_1Sr@mail.gmail.com>
Subject: Re: mks.jffs2 uid/gid for root inode
From: Arno Steffen <arno.steffen@googlemail.com>
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/9/9 Artem Bityutskiy <dedekind1@gmail.com>:
> On Thu, 2010-09-09 at 11:57 +0200, Arno Steffen wrote:
>> 2010/9/9 Artem Bityutskiy <dedekind1@gmail.com>:
>> > On Thu, 2010-09-09 at 08:17 +0200, Arno Steffen wrote:
>> >> Thanks, thought already nobody is interested in this. Regarding a
>> >> patch: I did look at the code, but my knowledge about the details is
>> >> to less.
>> >
>> > I've sent you the patch. Please, test v2 of the patch and let me know =
if
>> > it works for you. Thanks!
>> >
>> > --
>> > Best Regards,
>> > Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>>
>> Havn't got e mail with patch ?!?
>
> Attached. It was sent to the MTD ML and you was in CC.
>
> --
> Best Regards,
> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>

Thanks for the patch. But this is for ubifs, while I detected this bug
in jffs2 - this is what I am using.
So I can't test this.
Best regards
Arno
