Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7rCM-0002Rp-W6
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 15:00:27 +0000
Received: by fxm15 with SMTP id 15so696656fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Oct 2010 08:00:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20101018145620.GA22538@pengutronix.de>
References: <1287454010-2718-1-git-send-email-zhangyd6@gmail.com>
	<20101018145620.GA22538@pengutronix.de>
Date: Mon, 18 Oct 2010 23:00:25 +0800
Message-ID: <AANLkTink3zhFQSswA0XFvuZu=AUDmGxMWWbqWsF=qyB+@mail.gmail.com>
Subject: Re: [PATCH] mtd: chips: Add SST38VF640x NOR-flashes
From: yidong zhang <zhangyd6@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem.Bityutskiy@nokia.com, ladis@linux-mips.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 18, 2010 at 10:56 PM, Wolfram Sang <w.sang@pengutronix.de> wrot=
e:
> On Mon, Oct 18, 2010 at 10:06:50PM -0400, zhangyd wrote:
>> Du to the wrong sector size description(The actual sector size is
>> 8KBytes/sector, but the reporting size is 64KBytes/sector),you can get
>> the wrong size of the memory. So they should be moved to the jedec_probe=
.
>>
>> Signed-off-by: yidong zhang<zhangyd6@gmail.com>
>
> NACK as long as Guillaume has not finished updating the SST-support for C=
FI. He
> said he is working on this at the moment, let's give him a chance to fini=
sh :)

OK , Thanks!

> --
> Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | Wo=
lfram Sang =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
> Industrial Linux Solutions =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | http://www.p=
engutronix.de/ =A0|
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.9 (GNU/Linux)
>
> iEYEARECAAYFAky8YBQACgkQD27XaX1/VRtz6ACeMLJleCWrFki71rpj+0ELYala
> A8sAnA6Frg62shANhZn7xEW1196rHBxr
> =3DP1xd
> -----END PGP SIGNATURE-----
>
>
