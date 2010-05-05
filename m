Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9a9r-0003i1-KG
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 08:40:44 +0000
Date: Wed, 5 May 2010 10:40:37 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: Re: Some questions on bit-flips and JFFS2
In-Reply-To: <4BE12D86.2070605@aimvalley.nl>
Message-ID: <Pine.LNX.4.64.1005051039490.22753@lnxricardw.se.axis.com>
References: <201005031505.18604.muehlfelder@enertex.de>
	<4BDFE8D6.1050704@aimvalley.nl>
	<201005041659.26262.muehlfelder@enertex.de>
	<4BE12D86.2070605@aimvalley.nl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: =?iso-8859-1?Q?Thorsten_M=FChlfelder?= <muehlfelder@enertex.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 5 May 2010, Norbert van Bolhuis wrote:

>> I've already thought about something like this:
>> 1. After first succesful bootup dump a mtd0 image and calculate a md5sum=
 of
>> it:
>> nanddump -o -b -f mtd0.img /dev/mtd0
>> 2. Before each shutdown dump the image again and check if the md5sum has
>> changed.
>> 3. If it has changed write the initial dump back:
>> flash_eraseall /dev/mtd0
>> nandwrite -p /dev/mtd0 mtd0.img
>>
>> Would this be the right method?
>
> yes that's the idea, given that "refreshing" really helps to prevent
> (actually delay) future read disturbs.
> ...
>
> Another problem is a sudden reboot (e.g. crash or power-loss). There's=20
> no check then.

Also, if a power failure occurs during erase or nandwrite the system will=
=20
not boot next time.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
