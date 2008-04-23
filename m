Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JoZSk-0004uf-SM
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 07:32:19 +0000
Subject: Re: [RFC] slight UBI scan time improvement
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10804230015r50b7747apef8b1d8cab302c9a@mail.gmail.com>
References: <1208882552.11721.13.camel@sauron>
	<bae050c10804230015r50b7747apef8b1d8cab302c9a@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2008 10:32:51 +0300
Message-Id: <1208935971.11721.20.camel@sauron>
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

On Wed, 2008-04-23 at 15:15 +0800, Nancy wrote:
> I have tried, as you said slightly improve the scan time, slightly,
> even don't feel it exist. en....I don't like the two stages displaying
> when ubi attach to mtd. First time I see it, I doubt the NFS server is
> too busy. It is just like a kid playing sliding board who do not like
> being block in the middle, or a group of men "cheers!", then drink off
> the beer. Oh, don't make it stop in the half way.

Hmm, may be. But the reason for this is that we want to see this
information even if UBI refuses your MTD device later.

> You still do not add patch to handle write fail issue, a little disappoin=
tment.

I do not see any UBI/UBIFS issue in your case. The issue was that you
abused your flash using wrong tools, I think. Use the "ubiformat"
utility which we have recently implemented - the issue should go.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
