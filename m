Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IwaUS-0004vb-Dl
	for linux-mtd@lists.infradead.org; Mon, 26 Nov 2007 09:43:04 +0000
Date: Mon, 26 Nov 2007 10:42:04 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Brown <mtd@davidb.org>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
In-Reply-To: <20071123184029.GA11033@old.davidb.org>
Message-ID: <Pine.LNX.4.64.0711261031170.523@lnxricardw.se.axis.com>
References: <20071121213257.GI20871@lazybastard.org>
	<305035a40711211433x9054a11r11636ad708a325cd@mail.gmail.com>
	<20071121225425.GA24327@lazybastard.org>
	<Pine.LNX.4.64.0711220858190.523@lnxricardw.se.axis.com>
	<20071122132650.GA27525@lazybastard.org>
	<Pine.LNX.4.64.0711230836240.523@lnxricardw.se.axis.com>
	<1195805904.3231.87.camel@sauron>
	<Pine.LNX.4.64.0711231007070.523@lnxricardw.se.axis.com>
	<1195809712.3231.96.camel@sauron>
	<Pine.LNX.4.64.0711231026510.523@lnxricardw.se.axis.com>
	<20071123184029.GA11033@old.davidb.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 23 Nov 2007, David Brown wrote:

> Flash should be reasonably immune to degradation from reads.  In fact,=20
> it is fairly resiliant to degradation at all.

I beg to differ; we ran some tests here on a 256 Mbit NAND flash where I=20
work which showed a marked degradation in read integrity if the block had=
=20
been written many times. For this particular chip in the setup used, after=
=20
100 000 read/write cycles, non-correctable ECC errors started popping up=20
after about 43 million reads. For blocks that had only been written a=20
couple of times, we didn't detect any read errors whatsoever after 4.5e+10=
=20
reads (during three months of continuous reading of the same block).

I would however love to see some hard data, or at least an application=20
note, on the frequency of various errors. Most of the information I've=20
seen is of the 'it is a known fact that ...' - type, without any=20
references. And the data sheets seem very silent on this subject, only=20
acknowledging the fact that bit flips do occur.

> In NAND, the primary cause of read failures is caused by writes (and
> rewrites) of subsequent pages within a block.  These can cause bit flips =
in
> earlier written pages.  This gets worse with higher density, and is the
> main reason the higher density devices have greater restrictions on
> rewrites.

This is very interesting. This is something we did not address during our=
=20
tests mentioned above.

It implies that having a device partitioned into a read-only and a=20
read-write partition, would have very few bit flips occurring in the=20
read-only partition even if the read-write partition was rewritten very
frequently (since partitions must be multiples of the block size).

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
