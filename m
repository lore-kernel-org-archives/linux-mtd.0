Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gv8hm-0008TV-6v
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 03:46:13 -0500
Date: Fri, 15 Dec 2006 09:44:57 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Enrico Migliore <enrico.migliore@fatti.com>
Subject: Re: Eraseblocks torture: OneNAND results
In-Reply-To: <458254B0.6020802@fatti.com>
Message-ID: <Pine.LNX.4.64.0612150940580.11369@lnxricardw.se.axis.com>
References: <24414989.16841166158970543.JavaMail.weblogic@ep_ml08>
	<458254B0.6020802@fatti.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 15 Dec 2006, Enrico Migliore wrote:

> I've recently read  the Micron's "TN-29-16 Boot from NAND..."  technical
> note and got puzzled by the following:
>
> "Avoid excessive reads to the area of the NAND Flash where code is
> stored. When
> repeated accesses are required, the code should be copied to the DRAM.
> This minimizes
> the probability of read-disturb errors in the NAND Flash device."
>
> Does that mean that excessive readings might compromise the integrity of
> NAND cells?

That's the way I would interpret it too. (BTW, the paragraph wasn't there=
=20
in the first edition of the document, rev.A from March this year...).

Although I'm also somewhat puzzled at the conclusion. I always thought=20
read errors could occur at any time, the probability of which could be=20
increased by reading or even more writing to the device. But not that it=20
was localized to the area which you are reading. Although it makes sense I=
=20
guess; accessing a bit cell requires some activity in the vicinity of the=
=20
cell in order to read the bit, which I guess would increase the=20
probability of failure.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
