Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz5C7-0005Fj-0K
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 10:07:55 +0000
Received: by iwn36 with SMTP id 36so2691840iwn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 03:07:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1285322197.29268.167.camel@localhost>
References: <AANLkTikScro_GmWvVb6SCq5wTzMAfN+c_4Od2SBY+OpO@mail.gmail.com>
	<1283846532.2979.0.camel@localhost>
	<AANLkTi=mrqg21uOXPJf=dOUq20YD1ocAZJpf1=fodtVM@mail.gmail.com>
	<1284019747.2979.73.camel@localhost>
	<AANLkTi=SGuBghcHnFoZfe6j3jVxQbKxzSU7t4z+vwPxc@mail.gmail.com>
	<1284030609.27765.4.camel@localhost>
	<AANLkTikhyEJn97McTOSYcAXG11EeqfpXzRUdRqY0_1Sr@mail.gmail.com>
	<1284033943.27765.22.camel@localhost>
	<AANLkTimnho0HwowkvcrGV6sWUPT=XOmNjrfpB65O9GjO@mail.gmail.com>
	<1285322197.29268.167.camel@localhost>
Date: Fri, 24 Sep 2010 12:07:53 +0200
Message-ID: <AANLkTinqi7zZsZzsd0PTF=XV5KOp+v2k6woWV4JpV_WX@mail.gmail.com>
Subject: Re: mks.jffs2 uid/gid for root inode
From: Arno Steffen <arno.steffen@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/9/24 Artem Bityutskiy <dedekind1@gmail.com>:
> On Fri, 2010-09-24 at 11:52 +0200, Arno Steffen wrote:
>> 2010/9/9 Artem Bityutskiy <dedekind1@gmail.com>:
>> > On Thu, 2010-09-09 at 13:54 +0200, Arno Steffen wrote:
>> >> Thanks for the patch. But this is for ubifs, while I detected this bu=
g
>> >> in jffs2 - this is what I am using.
>> >
>> > Oh my god, I really need to start wearing glasses. Sorry. But the same
>> > bug exists in mkfs.ubifs, anyway. Since I'm not interested in JFFS2
>> > anymore, I'm not going to fix it. You can do analogous thing for
>> > mkfs.jffs2, if you wish.
>> >
>> > --
>> > Best Regards,
>> > Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>>
>> If it's mkfs.jffs2 is not your fokus, Artem, maybe David can have a look=
 at it.
>> It make sense to keep the same functionality for all mkfs tools.
>
> May be, unsurprisingly, I have no jurisdiction over him, he is free to
> do or not to do something for you.
>
> --
> Best Regards,
> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>
>

Hasn't expect an order. Just a broad hint for David ;) (or someone
else who has the ability).
If It would be just for me, I wouldn't push. I know that my only
chance is to argue.
