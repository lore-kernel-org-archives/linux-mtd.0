Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LN3sV-0001jj-Vb
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 11:25:46 +0000
Date: Wed, 14 Jan 2009 12:25:33 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: Access entire device with mtdblock0
In-Reply-To: <8bd0f97a0901140258n3cdc2637hdfcd8f162205c654@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0901141224540.27694@lnxricardw.se.axis.com>
References: <4967F2B2.4060405@jkmicro.com>
	<8bd0f97a0901131510k25addc8es917fb4e827bb2cf@mail.gmail.com>
	<878wpeclf1.fsf@macbook.be.48ers.dk>
	<8bd0f97a0901140258n3cdc2637hdfcd8f162205c654@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adam Yergovich <ayergo@jkmicro.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 14 Jan 2009, Mike Frysinger wrote:

> On Wed, Jan 14, 2009 at 04:00, Peter Korsgaard wrote:
>> "Mike" =3D=3D Mike Frysinger <writes:
>>>> Any recommendations on a simple way to create a partition using the
>>>> entirety of flash?
>>>
>> Why not just add a partition spanning the entire device in addition to
>> the other partitions?
>
> i was not aware partition tables allowed for overlaps.  if that's
> true, then the answer is obvious and easy to implement in boards ...

Sure does. We've used it for quite a while, using /dev/mtd0 to refer to=20
the whole flash, with /dev/mtd1,2,3... referring to the individual=20
partitions.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
