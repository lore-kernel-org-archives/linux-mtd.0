Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz52p-0000zY-Uc
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 09:58:20 +0000
Received: by fxm4 with SMTP id 4so2062335fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 02:58:17 -0700 (PDT)
Subject: Re: mks.jffs2 uid/gid for root inode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTimnho0HwowkvcrGV6sWUPT=XOmNjrfpB65O9GjO@mail.gmail.com>
References: <AANLkTikScro_GmWvVb6SCq5wTzMAfN+c_4Od2SBY+OpO@mail.gmail.com>
	<1283846532.2979.0.camel@localhost>
	<AANLkTi=mrqg21uOXPJf=dOUq20YD1ocAZJpf1=fodtVM@mail.gmail.com>
	<1284019747.2979.73.camel@localhost>
	<AANLkTi=SGuBghcHnFoZfe6j3jVxQbKxzSU7t4z+vwPxc@mail.gmail.com>
	<1284030609.27765.4.camel@localhost>
	<AANLkTikhyEJn97McTOSYcAXG11EeqfpXzRUdRqY0_1Sr@mail.gmail.com>
	<1284033943.27765.22.camel@localhost>
	<AANLkTimnho0HwowkvcrGV6sWUPT=XOmNjrfpB65O9GjO@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Sep 2010 12:56:37 +0300
Message-ID: <1285322197.29268.167.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-09-24 at 11:52 +0200, Arno Steffen wrote:
> 2010/9/9 Artem Bityutskiy <dedekind1@gmail.com>:
> > On Thu, 2010-09-09 at 13:54 +0200, Arno Steffen wrote:
> >> Thanks for the patch. But this is for ubifs, while I detected this bug
> >> in jffs2 - this is what I am using.
> >
> > Oh my god, I really need to start wearing glasses. Sorry. But the same
> > bug exists in mkfs.ubifs, anyway. Since I'm not interested in JFFS2
> > anymore, I'm not going to fix it. You can do analogous thing for
> > mkfs.jffs2, if you wish.
> >
> > --
> > Best Regards,
> > Artem Bityutskiy (Артём Битюцкий)
> 
> If it's mkfs.jffs2 is not your fokus, Artem, maybe David can have a look at it.
> It make sense to keep the same functionality for all mkfs tools.

May be, unsurprisingly, I have no jurisdiction over him, he is free to
do or not to do something for you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
