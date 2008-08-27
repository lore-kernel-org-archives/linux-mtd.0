Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KYITA-0000Y0-FB
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 10:41:45 +0000
Date: Wed, 27 Aug 2008 12:41:42 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Sheng-Zhe Zhao <a18689@motorola.com>
Subject: Re: [PATCH][MTD][NAND]Bad Block Management
In-Reply-To: <1219830684.13957.25.camel@il93elnxlog2>
Message-ID: <Pine.LNX.4.64.0808271240280.21707@lnxricardw.se.axis.com>
References: <1219830684.13957.25.camel@il93elnxlog2>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 27 Aug 2008, Sheng-Zhe Zhao wrote:

> Here come our patch and a short introduction for this patch. Any=20
> comments are welcome.

I tried to find it in the code but failed, I was wondering, how are bad=20
blocks detected - I mean ones that develop over time, not factory-marked=20
bad blocks.

> This patch implements "reserve block method" on Motorola's SCUM-A11=20
> platform mobile devices.  With the Reserved Block method, any exist bad

Why is it limited to this platform? The code looks generic enough.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
