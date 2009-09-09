Received: from mail-iw0-f192.google.com ([209.85.223.192])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MlJq8-0003nn-9m
	for linux-mtd@lists.infradead.org; Wed, 09 Sep 2009 09:51:53 +0000
Received: by iwn30 with SMTP id 30so1516250iwn.21
	for <linux-mtd@lists.infradead.org>;
	Wed, 09 Sep 2009 02:51:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4AA684A6.1000303@billgatliff.com>
References: <774508.54364.qm@web110103.mail.gq1.yahoo.com>
	<4AA684A6.1000303@billgatliff.com>
Date: Wed, 9 Sep 2009 17:51:46 +0800
Message-ID: <2df346410909090251x3c169efdtbcfb4ea2129a9456@mail.gmail.com>
Subject: Re: Ideal NAND flashes for JFFS2 or YAFFS
From: JiSheng Zhang <jszhang3@gmail.com>
To: Bill Gatliff <bgat@billgatliff.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
	Justin Treon <justin_treon@yahoo.com>,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/9/9 Bill Gatliff <bgat@billgatliff.com>:
> Justin Treon wrote:
>>
>> For NAND I think there is a simple flow chart to pick your filing system=
.
>>
>> Do you have a partition bigger than 256 MBytes?
>> If YES: Use UBIFS (@128 MB you can argue the point)
>> If NO: Do you have a LOT of RAM?
>> =A0 =A0 =A0 =A0If YES: Use YAFFS2 (It is fast, but RAM hungry)
>> =A0 =A0 =A0 =A0If NO: Use JFFS2
>>
>
> With 128MB and/or 1GB partitions, does YAFFS2 use more memory than UBIFS?
> =A0It does seem to me that YAFFS2 mounts a tad faster, though I haven't b=
roken
> out the stopwatch or anything (yet).

Once UBI2 implemented, ubi attach + ubifs mount will be faster than
yaffs2. Currently it seems that yaffs2 faster.

B.R,
jisheng
