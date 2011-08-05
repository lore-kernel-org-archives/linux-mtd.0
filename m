Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QpTMT-0003vj-Oa
	for linux-mtd@lists.infradead.org; Fri, 05 Aug 2011 22:59:26 +0000
Received: by wyh11 with SMTP id 11so906175wyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Aug 2011 15:59:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201108050929.40370.brian.foster@maxim-ic.com>
References: <1312480051-19208-1-git-send-email-computersforpeace@gmail.com>
	<201108050929.40370.brian.foster@maxim-ic.com>
Date: Fri, 5 Aug 2011 15:59:21 -0700
Message-ID: <CAN8TOE88F2O4Z=2KyHefACCD5MnTdRhoDj8iBrC22cL_u_HSmQ@mail.gmail.com>
Subject: Re: [PATCH] mtdinfo: don't open NULL pointer when getting region_info
	with `-a'
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maxim-ic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Mike Frysinger <vapier@gentoo.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi (other) Brian,

On Fri, Aug 5, 2011 at 12:29 AM, Brian Foster <brian.foster@maxim-ic.com> w=
rote:
> =A0I suggest adding some round brackets:
>
> =A0 =A0 =A0 =A0if (!args.node || (!args.map && mtd->region_cnt =3D=3D 0))
>
> =A0Less confusing. =A0Otherwise, looks Ok
> =A0to me (not actually built or tested).

Thanks for the comment. But I'm guessing this patch isn't the best
idea after all (unless Mike's plan doesn't work).

Anyway, it'd probably help if you test the final product, since you're
the one who actually sees the error!

Thanks,
Brian
