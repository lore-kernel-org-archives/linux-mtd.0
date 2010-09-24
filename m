Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz4x8-0008VX-Et
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 09:52:27 +0000
Received: by iwn36 with SMTP id 36so2680273iwn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 02:52:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1284033943.27765.22.camel@localhost>
References: <AANLkTikScro_GmWvVb6SCq5wTzMAfN+c_4Od2SBY+OpO@mail.gmail.com>
	<1283846532.2979.0.camel@localhost>
	<AANLkTi=mrqg21uOXPJf=dOUq20YD1ocAZJpf1=fodtVM@mail.gmail.com>
	<1284019747.2979.73.camel@localhost>
	<AANLkTi=SGuBghcHnFoZfe6j3jVxQbKxzSU7t4z+vwPxc@mail.gmail.com>
	<1284030609.27765.4.camel@localhost>
	<AANLkTikhyEJn97McTOSYcAXG11EeqfpXzRUdRqY0_1Sr@mail.gmail.com>
	<1284033943.27765.22.camel@localhost>
Date: Fri, 24 Sep 2010 11:52:22 +0200
Message-ID: <AANLkTimnho0HwowkvcrGV6sWUPT=XOmNjrfpB65O9GjO@mail.gmail.com>
Subject: Re: mks.jffs2 uid/gid for root inode
From: Arno Steffen <arno.steffen@googlemail.com>
To: dedekind1@gmail.com, David.Woodhouse@intel.com
Content-Type: text/plain; charset=UTF-8
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

2010/9/9 Artem Bityutskiy <dedekind1@gmail.com>:
> On Thu, 2010-09-09 at 13:54 +0200, Arno Steffen wrote:
>> Thanks for the patch. But this is for ubifs, while I detected this bug
>> in jffs2 - this is what I am using.
>
> Oh my god, I really need to start wearing glasses. Sorry. But the same
> bug exists in mkfs.ubifs, anyway. Since I'm not interested in JFFS2
> anymore, I'm not going to fix it. You can do analogous thing for
> mkfs.jffs2, if you wish.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)

If it's mkfs.jffs2 is not your fokus, Artem, maybe David can have a look at=
 it.
It make sense to keep the same functionality for all mkfs tools.

Best regards
Arno
