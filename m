Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ruo1s-0000Pz-PH
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 16:36:29 +0000
Date: Tue, 7 Feb 2012 17:36:25 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: Userspace write to UBI partitions
In-Reply-To: <20120207182944.334b4665@pixies.home.jungo.com>
Message-ID: <Pine.LNX.4.64.1202071733580.17234@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202071616560.17234@lnxricardw.se.axis.com>
 <20120207182944.334b4665@pixies.home.jungo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 7 Feb 2012, Shmulik Ladkani wrote:

> On Tue, 7 Feb 2012 16:20:58 +0100 (CET) Ricard Wanderlof <ricard.wanderlo=
f@axis.com> wrote:
>>
>> Is it possible to do a userspace write to a UBI volume as if it were pla=
in
>> flash memory, i.e. should I be able to do "cat somefile > /dev/ubi0_0" ?=
 I
>> get a 'Write Error: Operation not permitted' when I do this (Linux 2.6.3=
5)
>> but I'm pretty sure that I've used UBI volumes that way in the past, may
>> have been with older kernels then.
>
> Is your volume dynamic or static?

I tried both, but given the nature of the data we want to keep in the=20
volume it should really be dynamic.

> If dynamic, have you tried setting the UBI_VOL_PROP_DIRECT_WRITE
> property by issuing a UBI_IOCSETVOLPROP volume ioctl?
> (formerly named UBI_PROP_DIRECT_WRITE and UBI_IOCSETPROP)

Thanks for the pointer, I've never noticed this ioctl before.

I'll try this out. In the meantime, there doesn't seem to be an ioctl for=
=20
erasing blocks?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
