Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdXA9-0006HE-M1
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2018 08:41:27 +0000
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
Date: Thu, 12 Jul 2018 08:40:33 +0000
Message-ID: <81218b8d34df4881af81bb36fa55bf44@SIWEX5A.sing.micron.com>
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

Hi, Boris
It is true. Bit7 of byte4 in READID changes after enable/disable internal E=
CC in case of  its default value is 0.=20
Also this bit value  is volatile. After power cyling, it resets to default =
value. I don't know if
this condition will be changed or kept since maybe it was a specific design=
 request from customers.
But GET Feature is still the preferred way to determine the state of ECC, w=
e recommend using this way.=20
If internal ECC is default on, we don't do anything, and if default is off,=
 then SET feature and GET feature.
This always makes sense.

I am still digging into why this doesn't depict in datasheet and whether th=
is will be kept in coming design.
As long I have new update, I will back to you.

>
>That's not what the board I have on my desk says. I have a
>MT29F2G08ABAEAH4, and I can tell you for sure this bit changes when I
>enable/disable on-die ECC. Do the test, and you'll see...
>
>See, that's what I'm complaining about. You keep saying things that appear=
 to
>be untrue when when we check on real HW parts. So, either we have NANDs
>that are buggy, or you didn't check yourself.
>
>Regards,
>
>Boris
