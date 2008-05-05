Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JswQg-00024E-0N
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 08:52:14 +0000
Subject: Re: [PATCH] mkfs.ubifs: support --squash-uids
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080505084617.GA11042@cloud.net.au>
References: <20080502051655.GA6654@cloud.net.au>
	<1209972672.3645.8.camel@sauron> <20080505084617.GA11042@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Mon, 05 May 2008 11:52:00 +0300
Message-Id: <1209977520.3645.15.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-05-05 at 18:46 +1000, Hamish Moffatt wrote:
> Good point. mkfs.jffs2 (from my reading of the source code) squashes=20
> ownership of files read from the specified root directory, but the
> ownerships specified in the device table are still used. I think that
> makes sense, because you can always specify 0:0 in the device table if
> that's what you need.
>=20
> However it's not what is implemented by my patch :-) Would you like me
> to fix it up and resubmit, or will you? I applied the squashing at the
> lowest level without realizing the effect on the device table.

I think I can do this, but a bit later. So if it is not urgent for you,
you may want to just wait.

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
