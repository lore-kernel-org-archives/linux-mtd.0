Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxQHi-0001ei-GJ
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 15:19:56 +0100
Message-ID: <42E646E5.2040802@inf.u-szeged.hu>
Date: Tue, 26 Jul 2005 16:21:25 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: =?ISO-8859-2?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <E1DxPLP-0004rN-Ld@phoenix.infradead.org>
	<20050726140847.GD30656@wohnheim.fh-wedel.de>
In-Reply-To: <20050726140847.GD30656@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, havasi@infradead.org
Subject: Re: mtd/include/linux jffs2.h,1.35,1.36
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:

>>-#define JFFS2_COMPR_LZO         0x07
>>-#define JFFS2_COMPR_LZARI       0x08
>> /* Compatibility flags. */
>> #define JFFS2_COMPAT_MASK 0xc000      /* What do to if an unknown node=
type is found */
>> #define JFFS2_NODE_ACCURATE 0x2000
>>   =20
>>
>
>This patch could cause problems.  We have to make sure 0x07 and 0x08
>are never handed out for new compressors, one way or another.
>
>Ferenc, can you add a comment that those numbers are reserved or
>obsoleted?
> =20
>
Compressor lzo and lzari were never used really, I think nobody has
JFFS2 image with blocks compressed by them.

But if you think I can add a comment to make absolutely sure.

Ferenc
