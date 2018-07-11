Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdDV5-0002aw-Ui
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2018 11:41:48 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>
Subject: RE: [EXT] Re:  [PATCH 2/2] mtd: rawnand: micron: Fix on-die ECC
 detection logic
Date: Wed, 11 Jul 2018 11:41:01 +0000
Message-ID: <63aabb45edfe4d17b00ce8eed5f53f49@SIWEX5A.sing.micron.com>
References: <1be1ede4dcf14f24b68b8497b167c1b3@SIWEX5A.sing.micron.com>
 <20180711123209.5271d411@bbrezillon>
In-Reply-To: <20180711123209.5271d411@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> Here I say for sure, the value of Bit7 in byte 4 of READID is
>> permanent. It is a reflection of the default state of the device. it can=
not
>change by set feature.
>
>That's not what the board I have on my desk says. I have a
>MT29F2G08ABAEAH4, and I can tell you for sure this bit changes when I
>enable/disable on-die ECC. Do the test, and you'll see...
>
This is very interesting. MT29F2G08ABAEAH4 is 60s NAND, unfortunately, I do=
n't have 60s sample.
I will check, and back you.

>See, that's what I'm complaining about. You keep saying things that appear=
 to
>be untrue when when we check on real HW parts. So, either we have NANDs
>that are buggy, or you didn't check yourself.
>
>Regards,
>
>Boris
