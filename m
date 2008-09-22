Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KhhOw-0004zQ-Vr
	for linux-mtd@lists.infradead.org; Mon, 22 Sep 2008 09:08:15 +0000
Date: Mon, 22 Sep 2008 11:08:09 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: Problem with Hynix HY27UF081G2A 1Gb NAND flash?
In-Reply-To: <lyhc8ccfzv.fsf@ensc-virt.intern.sigma-chemnitz.de>
Message-ID: <Pine.LNX.4.64.0809221107180.29177@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0809191409210.29177@lnxricardw.se.axis.com>
	<lyhc8ccfzv.fsf@ensc-virt.intern.sigma-chemnitz.de>
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


On Fri, 19 Sep 2008, Enrico Scholz wrote:

> Ricard Wanderlof <ricard.wanderlof@axis.com> writes:
>
>> I'm testing the above mentioned NAND flash chip in a design
>> which has previously used the corresponding 1Gb parts from
>> Samsung and Numonyx (ST) without problems. However, with the
>> Hynix chip, mtd won't even read the ID code, it's just as if
>> the chip wasn't there (it fails with
>
> Some Hynix NAND chips seem to have problems with bus arbitration;
> e.g. they continue to shift out data when chipselect is
> deasserted during a operation (e.g. because ethernet controller
> was accessed in this time).  We saw this with HY27UG088G5M on
> PXA320 and read-page operations.

Interesting. We don't have any other devices on the bus that the NAND chip=
=20
is connected to however.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
    "With Free Software you are employing the best programmers on the plane=
t"
