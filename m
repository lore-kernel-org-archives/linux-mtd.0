Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IvUqH-0001Yw-IW
	for linux-mtd@lists.infradead.org; Fri, 23 Nov 2007 04:29:03 -0500
Date: Fri, 23 Nov 2007 10:28:24 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
In-Reply-To: <1195809712.3231.96.camel@sauron>
Message-ID: <Pine.LNX.4.64.0711231026510.523@lnxricardw.se.axis.com>
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<Pine.LNX.4.64.0711212145070.24710@lnxricardw.se.axis.com>
	<20071121213257.GI20871@lazybastard.org>
	<305035a40711211433x9054a11r11636ad708a325cd@mail.gmail.com>
	<20071121225425.GA24327@lazybastard.org>
	<Pine.LNX.4.64.0711220858190.523@lnxricardw.se.axis.com>
	<20071122132650.GA27525@lazybastard.org>
	<Pine.LNX.4.64.0711230836240.523@lnxricardw.se.axis.com>
	<1195805904.3231.87.camel@sauron>
	<Pine.LNX.4.64.0711231007070.523@lnxricardw.se.axis.com>
	<1195809712.3231.96.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 23 Nov 2007, Artem Bityutskiy wrote:

> On Fri, 2007-11-23 at 10:08 +0100, Ricard Wanderlof wrote:
>> Does UBI periodically scan the flash for bit flips, or is the scrubbing
>> mechanism only triggered when an mtd_read() is done by a higher layer?
>
> No, it does not do any background scanning for bit-flips. The second is
> true.
>
> If one needs some scanning, it may be implemented by making a
> users-space script run by cron daemon I guess.

On second thought, I think that the degradation of the data in a
flash memory cell is mostly due to read operations, so if no read=20
operations are performed, the data should be fairly secure. Then again,=20
there are subtle effects such as cosmic radiation flipping bits at any=20
random location, etc.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
