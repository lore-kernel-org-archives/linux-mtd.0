Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKwd8-00064L-Hh
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 07:31:17 -0400
Message-ID: <433BD154.1050403@inf.u-szeged.hu>
Date: Thu, 29 Sep 2005 13:34:44 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: =?ISO-8859-2?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<20050929101247.GD18741@wohnheim.fh-wedel.de>
	<433BC021.7090409@yandex.ru>
	<20050929102620.GE18741@wohnheim.fh-wedel.de>
In-Reply-To: <20050929102620.GE18741@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	"hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:

>On Thu, 29 September 2005 14:21:21 +0400, Artem B. Bityutskiy wrote:
> =20
>
>>J=F6rn Engel wrote:
>>   =20
>>
>>>Dummy argument.  Wear levelling is just a means to avoid the real
>>>problem - early wear-out of specific blocks.  Spending one erase block
>>>for cs is pretty sane, as long as this block doesn't wear-out well
>>>before the rest.
>>>     =20
>>>
>>"As long as" is the essential part. If it is true - nice. In general=20
>>this can't be true. And, anticipating your remark, I agree that it stil=
l=20
>>may have its place. :-)
>>   =20
>>
>
>Agreed.  In general, this patch opens an option for a DoS attack.
> =20
>
Maybe I don't understand something. How makes CS possible DoS attacks?

Ferenc
