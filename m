Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqjo5-00018q-L8
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 17:12:30 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "richard@nod.at"
 <richard@nod.at>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "Cyrille
 Pitchen" <cyrille.pitchen@atmel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Campbell
 <ijc+devicetree@hellion.org.uk>, "pawel.moll@arm.com" <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, "galak@codeaurora.org"
 <galak@codeaurora.org>
Subject: RE: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Date: Wed, 22 Mar 2017 17:11:31 +0000
Message-ID: <c4dd0c48d345412687a55e7904b63815@SIWEX5A.sing.micron.com>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
 <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
 <20170322144507.4d80d2cc@bbrezillon>
 <0dccc0abcf234e98be6d340027cf1a30@SIWEX5A.sing.micron.com>
 <20170322155216.319efc3e@bbrezillon>
In-Reply-To: <20170322155216.319efc3e@bbrezillon>
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

Hi Boris

>>
>> For the Micron SLC NAND with on Die ECC, please note only for the "SLC
>> NAND with on Die ECC", You can always differentiate these two
>> generation NAND by ONFI table byte 112 "Number of bits ECC
>> correctability ", if its value is 4, it is 60s; if it's 8, it is 70s. th=
is is a permanent
>method for both 60s and 70s "SLC NAND with on Die ECC".
>
>The question is, how can we know if the NAND supports on-die ECC?
>
>We were basing our detection on the "Internal ECC" bit in READ_ID, but it =
seems
>this bit is actually reflecting the current ECC engine status (enabled/dis=
abled),
>which is disturbing, since information returned by the READ_ID are suppose=
d to
>be static :-(.
>

This is very difficult question, as a Micron worker, this is also a headach=
e to me.
Device ID byte 4 can't be fully trusted, it always changes. Anyway, I will =
give you
A better answer in 2 days. Hopefully.
