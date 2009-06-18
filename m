Received: from mail-yx0-f173.google.com ([209.85.210.173])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MH7wP-0000Po-Jm
	for linux-mtd@lists.infradead.org; Thu, 18 Jun 2009 03:05:36 +0000
Received: by yxe3 with SMTP id 3so33210yxe.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Jun 2009 20:05:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090601100211.GD14373@duck.suse.cz>
References: <17cc26190905290122u52e2f9a1q15103557e214883e@mail.gmail.com>
	<20090601100211.GD14373@duck.suse.cz>
Date: Thu, 18 Jun 2009 11:05:27 +0800
Message-ID: <e8775dd00906172005m140df95bnb3a0006318b3edac@mail.gmail.com>
Subject: Re: JFFS2 filesystem problem
From: Jason Liu <liu.h.jason@gmail.com>
To: Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: npiggin@suse.de, linux-mtd@lists.infradead.org,
	anees a m <aneesgnu@gmail.com>, dwmw2@infradead.org,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/6/1 Jan Kara <jack@suse.cz>:
> =A0Hello,
>
> On Fri 29-05-09 13:52:05, anees a m wrote:
>> Iam uses JFFS2 filesystem for an embedded flash device. But when the pow=
er
>> is removed i between, the JFFS2 filesystem is corrupted.Resulting in fai=
ls.
>> Iam able to find that the JFFS2 garbage collector is causing the problem=
. If
>> mounted as READ only, I dont have an issue, but mounting write only is
>> resulting in corrupted filesystem some times.
>>
>> Unfortunately I need to mount it with read write support.
> =A0I'm not sure why you decided to write to linux-ext4 mailing list, to m=
e
> and to Nick. Anyway, the right person for this report seems to be David
> Woodhouse who's listed as a maintainer of JFFS2 filesystem.
> =A0Adding him to CC.
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Honz=
a
Yes, I have the same problems. Have you resolved the issues?What's the
kernel version you are using. We are using, .2.6.28 kernel.
> --
> Jan Kara <jack@suse.cz>
> SUSE Labs, CR
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
