Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GmmlX-0002vC-W0
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 02:43:40 -0500
Date: Wed, 22 Nov 2006 08:42:18 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Duke <ezbonites@gmail.com>
Subject: Re: mtd_debug usage
In-Reply-To: <79ac09b60611211505h6682e31ay46ecc5b8fe160b0@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0611220832300.3738@lnxricardw.se.axis.com>
References: <79ac09b60611210826j33b6b2aeh95d9259ddd3f0481@mail.gmail.com>
	<79ac09b60611211505h6682e31ay46ecc5b8fe160b0@mail.gmail.com>
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


On Tue, 21 Nov 2006, Duke wrote:

>> I've seen usage where /dev/mtd2 is used instead of /dev/mtdblock2,
>> what is the difference here? which should it be. It seems to me that
>> /dev/mtd2 simply gives the node info (mtd_debug info )and
>> /dev/mtdblock2 is really what you want to used. Do I have this
>> correct?

mtdblock devices are normally only used with the mount/umount commands.=20
For erase /dev/mtdX is required - the mtdblock devices don't support the=20
required ioctls. Actually, since a while back, it's not necessary to use=20
/dev/mtdblockX devices for mount/umount either since they understand=20
'mtdX' directly as in  mount -t cramfs mtd1 /mnt/mountpoint .

mtdblock devices do support an automatic erase-before-write functionality=
=20
when writing. This used to be buggy, don't know the status of this. As far=
=20
as I'm concerned, it's of little use anyway, because if the image you are=
=20
writing is smaller than the partition, using this feature will leave the=20
end of the partition unerased which is probably not what you want. Doing=20
separate erase and write operations is thus preferable IMHO.

> Creating 3 MTD partitions on "physmap-flash.0":
> 0x00000000-0x00040000 : "boot"
> 0x00040000-0x00200000 : "kernel"
> 0x00200000-0x00800000 : "cramfs"
>
> When I ran mtd_debug I get the following from the above mapping:
>
> # mtd_debug info /dev/mtd2
> mtd.size =3D 1835008 (1M)
>
> # mtd_debug info /dev/mtd1
> mtd.size =3D 262144 (256K)
>
> # mtd_debug info /dev/mtd0
> mtd.size =3D 262144 (256K)
>
> # mtd_debug info /dev/mtd3
> mtd.size =3D 1835008 (1M)

Looks like your minor numbers are screwed up for the /dev/mtd devices. 0=20
and 1 seem to have the same size, as to 2 and 3. Normally mtd0 is the=20
whole flash, with the first partition being in mtd1 (someone please=20
correct me if I'm wrong here). mtd0/1 seems to refer to the first 256k=20
boot partition, with mtd2/3 referring to the kernel partition with the=20
size of 0x1c0000 =3D 1835008.

What does  ls -l /dev/mtd*  (and ls -l /dev/mtdblock*) say?

> # mtd_debug erase /dev/mtdblock2 0 0x600000
> MEMERASE: Inappropriate ioctl for device

You must use /dev/mtd2 for erasure.

> Clearly I'm missing something here. Could someone help me understand this=
?

The problem seems to have something to do with the device mapping, your=20
commands look ok at least to start with.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
