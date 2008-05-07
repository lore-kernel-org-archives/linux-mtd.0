Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtjCK-0005td-9e
	for linux-mtd@lists.infradead.org; Wed, 07 May 2008 12:56:40 +0000
Subject: Re: [PATCH] mkfs.ubifs: support --squash-uids
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080506094642.GB23685@cloud.net.au>
References: <20080502051655.GA6654@cloud.net.au>
	<1209972672.3645.8.camel@sauron> <20080505084617.GA11042@cloud.net.au>
	<1210055916.3645.21.camel@sauron> <20080506094642.GB23685@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Wed, 07 May 2008 15:55:34 +0300
Message-Id: <1210164935.3645.39.camel@sauron>
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

On Tue, 2008-05-06 at 19:46 +1000, Hamish Moffatt wrote:
> Also, what is the purpose of --max-leb-cnt? It seems to be just a safety
> check that the volume will fit? It's a bit unusual.

Just added this FAQ entry:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt

Let me know if I did not put it clear enough there.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
