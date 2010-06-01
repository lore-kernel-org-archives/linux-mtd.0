Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJOTo-0006oU-3Y
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 10:13:52 +0000
From: Thorsten =?iso-8859-1?q?M=FChlfelder?= <muehlfelder@enertex.de>
To: linux-mtd@lists.infradead.org
Subject: Re: How stable is jffs2 summarize option?
Date: Tue, 1 Jun 2010 12:13:50 +0200
References: <201005311503.42629.muehlfelder@enertex.de>
	<201006011126.23862.muehlfelder@enertex.de>
	<AANLkTik7JCuxgYe623F0CaR2OAA2f3Wohvp5btP_7y7c@mail.gmail.com>
In-Reply-To: <AANLkTik7JCuxgYe623F0CaR2OAA2f3Wohvp5btP_7y7c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201006011213.50278.muehlfelder@enertex.de>
Cc: Vitaly Wool <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Tuesday 01 June 2010 11:47:27 schrieb Vitaly Wool:
> Hi Thorsten,
>
> 2010/6/1 Thorsten M=FChlfelder <muehlfelder@enertex.de>:
> > and what do you think about switching to yaffs2? I know it is developed
> > elsewhere, but it seems to be a good alternative to jffs2+summary and
> > probably switching is easier than to ubifs.
>
> Can you please share your reasons why you're considering switching first?
> :)
>

Hi Vitaly,
1. We've used JFFS2 without summary until now, but now I have to reduce the=
=20
boot time to the minimum possible. So first idea was the summary option,=20
because other than slow mount times JFFS2 has worked OK. But if I do a majo=
r=20
change now, why not switch to a more modern FS which will fasten boot up ev=
en=20
more? ;-)

Additional requirements:
Sometimes it's written to the root FS and the device must be aware of power=
=20
failures during write. I guess all the mentioned FS can handle this quite=20
well.

Greetings
Thorsten
