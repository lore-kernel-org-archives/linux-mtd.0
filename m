Received: from tyo202.gate.nec.co.jp ([210.143.35.52])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESDqK-0004Ka-15
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2005 09:19:07 -0400
Message-ID: <435647A8.6090103@ak.jp.nec.com>
Date: Wed, 19 Oct 2005 22:18:32 +0900
From: Kaigai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <431E772B.9090004@ak.jp.nec.com>	<20050908194915.GG20668@wohnheim.fh-wedel.de>	<43210C7A.60109@ak.jp.nec.com>	<20050909072416.GA19251@wohnheim.fh-wedel.de>	<43225DEB.4070809@ak.jp.nec.com>	<20050911114642.GA11788@wohnheim.fh-wedel.de>	<4324E525.60805@ak.jp.nec.com>	<20050912064038.GA21304@wohnheim.fh-wedel.de>	<43255FF5.4020903@ak.jp.nec.com>
	<433A57D8.9030501@ak.jp.nec.com>
	<20050929074500.GA16687@wohnheim.fh-wedel.de>
In-Reply-To: <20050929074500.GA16687@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: James Morris <jmorris@redhat.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Stephen Smalley <sds@tycho.nsa.gov>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi J=F6rn,

What status is the XATTR patch of JFFS2 now ??

I hope to merge it, if this patch has no problem.
Of course, I'll correct any inconvenient points which we found.

# I droped a Cc: for Ma, since his address seems to be invalid.

J=F6rn Engel wrote:
> On Wed, 28 September 2005 17:44:08 +0900, Kaigai Kohei wrote:
>=20
>>I revised the previous xattr patch in jffs2 based on some suggestions.
>>
>>[1] scanning xattr related node for cleaned-up scan.c.
>>    (jffs2_xattr_scan.c-cleanup.patch)
>>[2] enables xattr support in jffs2.
>>    (jffs2_xattr_take-3.patch)
>>(*) We can apply jffs2_xattr_take-3.patch for current CVS independently.
>=20
>=20
> Looks quite interesting.  I'll take a closer look over the weekend.
>=20
> Thanks!
>=20
> J=F6rn

--=20
Linux Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
