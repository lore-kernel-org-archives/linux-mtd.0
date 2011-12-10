Received: from mail-vx0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RZBDV-0007Zf-Px
 for linux-mtd@lists.infradead.org; Sat, 10 Dec 2011 00:55:10 +0000
Received: by vcbfl10 with SMTP id fl10so3570888vcb.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Dec 2011 16:55:02 -0800 (PST)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <F8730DE65A2E4EB3BC47D4C2DC317502@THOR>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
 <AANLkTinQ=vHZgQ5B2YnsDkKzmCD288JwzTUgTUP-9whV@mail.gmail.com>
 <AANLkTimUVCRZLQma2xRChr51y1Fi5E2p31qFQS=B20Sw@mail.gmail.com>
 <201010221950.57594.fabio.giovagnini@aurion-tech.com>
 <DEF16A5C46894A5DB447E0F7C81A9D5F@THOR>
 <F8730DE65A2E4EB3BC47D4C2DC317502@THOR>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 10 Dec 2011 01:54:40 +0100
Message-ID: <CAJpamw5n+UYDauw5oDoMvpUycdtUJdRALT28sbg5iTciUzv9RA@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
To: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: yidong zhang <zhangyd6@gmail.com>, David.Woodhouse@intel.com,
 Wolfram Sang <w.sang@pengutronix.de>, yegorslists@googlemail.com,
 linux-mtd@lists.infradead.org, taliaferro62@gmail.com,
 Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

2011/6/20 Fl=C3=A1vio Silveira <fggs@terra.com.br>:
> Hi,
> =C2=A0I'm attaching some other files to see if it helps finding what's wr=
ong.

According to your cfi_cmdset_0002.c version, you need this patch
allowing chips with no PRI (extp =3D=3D null) to be correctly detected :
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commitdiff/564b84978=
df2bf83d334940f1a1190702579f79f


--=20
Guillaume LECERF
OpenBricks developer - www.openbricks.org
