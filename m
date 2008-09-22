Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KhiBZ-0003Dy-Eh
	for linux-mtd@lists.infradead.org; Mon, 22 Sep 2008 09:58:30 +0000
Date: Mon, 22 Sep 2008 11:58:26 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: Problem with Hynix HY27UF081G2A 1Gb NAND flash?
In-Reply-To: <Pine.LNX.4.64.0809221107180.29177@lnxricardw.se.axis.com>
Message-ID: <Pine.LNX.4.64.0809221157370.29177@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0809191409210.29177@lnxricardw.se.axis.com>
	<lyhc8ccfzv.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<Pine.LNX.4.64.0809221107180.29177@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
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


On Mon, 22 Sep 2008, Ricard Wanderlof wrote:

>
> On Fri, 19 Sep 2008, Enrico Scholz wrote:
>
>> Some Hynix NAND chips seem to have problems with bus arbitration;
>> e.g. they continue to shift out data when chipselect is
>> deasserted during a operation (e.g. because ethernet controller
>> was accessed in this time).  We saw this with HY27UG088G5M on
>> PXA320 and read-page operations.
>
> Interesting. We don't have any other devices on the bus that the NAND=20
> chip is connected to however.

Sorry, I was wrong, we do share the bus with the RAM (mixed up two designs=
=20
here). Did you only see the problem with page read operations, or was it a=
=20
general problem. We don't even seem to get by the ID read stage.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
    "With Free Software you are employing the best programmers on the plane=
t"
