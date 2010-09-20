Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OxoCh-0006Yg-KO
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 21:47:16 +0000
Received: by vws11 with SMTP id 11so4219985vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2010 14:47:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1284971403.2286.45.camel@localhost>
References: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
	<1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
	<AANLkTinqy+hYrj5WN=4QEbPu+8F_HFs+rrb35TThoBRm@mail.gmail.com>
	<1284971403.2286.45.camel@localhost>
Date: Mon, 20 Sep 2010 14:47:14 -0700
Message-ID: <AANLkTikfAveMKPCx29JH+BkqtQgF4qLXD2zhzPAA=FXV@mail.gmail.com>
Subject: Re: [PATCH 2.6.35] mtd: blktrans: Move device and module ref-counting
	back to open/release
From: Kevin Cernekee <cernekee@gmail.com>
To: dedekind1@gmail.com, Maxim Levitsky <maximlevitsky@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Ben Hutchings <bhutchings@solarflare.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 20, 2010 at 1:30 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Sun, 2010-09-05 at 16:34 -0700, Kevin Cernekee wrote:
>> Just updated to 2.6.36-rc3 and noticed a related issue. =C2=A0Configurat=
ion is:
>>
>> CONFIG_MTD_BLOCK=3Dy
>> CONFIG_MTD_BLKDEVS=3Dy
>> CONFIG_MTD_UBI_GLUEBI=3Dy
>
> Would you please check if Maxim's patch fixes this:
> [PATCH V2] MTD: blktrans: Final version of hotplug support

I applied the following patch to my 2.6.36-rc4 tree:

Subject: [PATCH 1/3] MTD: blktrans: Final version of hotplug support
Date: Sun, 19 Sep 2010 01:12:36 +0200
Message-Id: <1284851558-1154-2-git-send-email-maximlevitsky@gmail.com>

This fixed the MTD_BLOCK + MTD_UBI_GLUEBI regression that I reported earlie=
r.

Thanks.
