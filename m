Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAOo4-0000wQ-Bg
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2005 05:23:02 -0400
Message-ID: <431576F8.8070405@inf.u-szeged.hu>
Date: Wed, 31 Aug 2005 11:23:04 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: =?ISO-8859-2?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20050826102512.GA23886@wohnheim.fh-wedel.de>
	<1125087149.26481.12.camel@windu.rchland.ibm.com>
	<20050829100722.GB17088@wohnheim.fh-wedel.de>
	<1125340972.30800.7.camel@windu.rchland.ibm.com>
	<20050829185042.GA28514@wohnheim.fh-wedel.de>
	<43142B62.6040909@inf.u-szeged.hu>
	<20050830100036.GB9504@wohnheim.fh-wedel.de>
In-Reply-To: <20050830100036.GB9504@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:

>On Tue, 30 August 2005 11:48:18 +0200, Ferenc Havasi wrote:
> =20
>
>>What do you think about this patch?
>>   =20
>>
>
>I like it.  If you could turn JFFS2_BLOCKS_USE_VMALLOC into an inline
>function (for type safety) and use a lowercase name, we have a winner.
> =20
>
OK, it's ready: http://www.inf.u-szeged.hu/jffs2/jffs2-novirtblocks.patch

May I commit it? (for temporary solution)

Ferenc
