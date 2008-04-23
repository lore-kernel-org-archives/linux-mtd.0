Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JoeXw-0003Kd-Nb
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 12:58:01 +0000
Subject: Re: [RFC] slight UBI scan time improvement
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080423124046.GA16201@cloud.net.au>
References: <1208882552.11721.13.camel@sauron>
	<20080423073840.GA9472@cloud.net.au> <480EEFAB.7010304@parrot.com>
	<1208938864.11721.44.camel@sauron>
	<20080423124046.GA16201@cloud.net.au>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2008 15:57:47 +0300
Message-Id: <1208955467.11721.69.camel@sauron>
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

On Wed, 2008-04-23 at 22:40 +1000, Hamish Moffatt wrote:
> Well I think from past use of "time ubiattach ..." that most of
> the missing time is in the attach.=20
Sure, UBI takes most of the time. Its just if you want to save 1.2+ sec,
you may try to play with on-flash BBT.

> Would combining the bad block scan with the UBI scan save time? I guess
> it would be a bad layering violation however :-)
Yeah, it could be done as custom hack but not for mainstream.

> What sort of speed do you get using
> dd if=3D/dev/mtdblock9 of=3D/tmp/foo bs=3D128K count=3D64
> (where mtdblock9 is your raw mtd NAND device). I'm seeing about 6
> seconds to read that 8Mb, which is quite long I guess.

I have busybox so stuff like 128K does not work. Here are my results:

# time dd if=3D/dev/mtd4 of=3D/dev/null bs=3D131072 count=3D64
64+0 records in
64+0 records out
real    0m 0.28s
user    0m 0.00s
sys     0m 0.28s

# time dd if=3D/dev/mtd4 of=3D/dev/null bs=3D131072 count=3D256
256+0 records in
256+0 records out
real    0m 1.12s
user    0m 0.00s
sys     0m 1.11s

Its OneNAND which has a controller and it is quite quick.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
