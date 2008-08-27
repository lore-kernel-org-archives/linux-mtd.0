Received: from mail128.messagelabs.com ([216.82.250.131])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KYIey-00075L-9n
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 10:53:56 +0000
Received: from il27exr01.cig.mot.com (il27exr01.mot.com [10.17.196.70])
	by motgate2.mot.com (8.12.11/Motorola) with ESMTP id m7RArsS5025866
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Aug 2008 03:53:54 -0700 (MST)
Received: from az10vts02.mot.com (il27vts02.cig.mot.com [10.17.196.86])
	by il27exr01.cig.mot.com (8.13.1/Vontu) with SMTP id m7RArsRL027082
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Aug 2008 05:53:54 -0500 (CDT)
Received: from zmy16exm63.ds.mot.com (zmy16exm63.ap.mot.com [10.179.4.34])
	by il27exr01.cig.mot.com (8.13.1/8.13.0) with ESMTP id m7RArqNH027056
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Aug 2008 05:53:53 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH][MTD][NAND]Bad Block Management
Date: Wed, 27 Aug 2008 18:53:51 +0800
Message-ID: <93481F4E3CC5F042BBDE9376E50F759A026F6BD3@zmy16exm63.ds.mot.com>
In-Reply-To: <Pine.LNX.4.64.0808271240280.21707@lnxricardw.se.axis.com>
References: <1219830684.13957.25.camel@il93elnxlog2>
	<Pine.LNX.4.64.0808271240280.21707@lnxricardw.se.axis.com>
From: "Zhao Shengzhe-a18689" <a18689@motorola.com>
To: "Ricard Wanderlof" <ricard.wanderlof@axis.com>,
	<linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

See my comments below

-----Original Message-----
From: Ricard Wanderlof [mailto:ricard.wanderlof@axis.com]=20
Sent: Wednesday, August 27, 2008 6:42 PM
To: Zhao Shengzhe-a18689
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH][MTD][NAND]Bad Block Management


On Wed, 27 Aug 2008, Sheng-Zhe Zhao wrote:

> Here come our patch and a short introduction for this patch. Any=20
> comments are welcome.

I tried to find it in the code but failed, I was wondering, how are bad =
blocks detected - I mean ones that develop over time, not factory-marked =
bad blocks.
[Shengzhe Zhao]
The bad blocks will be detected by low-level hardware driver. The NAN =
devices have a Status Register that indicates whether an operation is =
successful or not. Additional Bad Blocks are identified when attempts to =
program or erase give errors in the Status Register. Since our patch is =
in MTD layer, so you cannot find the codes for detecting bad blocks.

> This patch implements "reserve block method" on Motorola's SCUM-A11=20
> platform mobile devices.  With the Reserved Block method, any exist=20
> bad

Why is it limited to this platform? The code looks generic enough.
[Shengzhe Zhao]
This patch is not limited to Moto platform only. Here we mentioned Moto =
platform just want to say it has been used in real product already.=20

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
