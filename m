Received: from ug-out-1314.google.com ([66.249.92.172])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gmt0v-0007xg-5R
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 09:24:30 -0500
Received: by ug-out-1314.google.com with SMTP id m2so161713uge
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Nov 2006 06:23:46 -0800 (PST)
Message-ID: <79ac09b60611220623l48d5d3b0k152a196f512fc82a@mail.gmail.com>
Date: Wed, 22 Nov 2006 08:23:45 -0600
From: Duke <ezbonites@gmail.com>
To: "Ricard Wanderlof" <ricard.wanderlof@axis.com>
Subject: Re: mtd_debug usage
In-Reply-To: <Pine.LNX.4.64.0611220832300.3738@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <79ac09b60611210826j33b6b2aeh95d9259ddd3f0481@mail.gmail.com>
	<79ac09b60611211505h6682e31ay46ecc5b8fe160b0@mail.gmail.com>
	<Pine.LNX.4.64.0611220832300.3738@lnxricardw.se.axis.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/22/06, Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
>
> On Tue, 21 Nov 2006, Duke wrote:
>
> >> I've seen usage where /dev/mtd2 is used instead of /dev/mtdblock2,
> >> what is the difference here? which should it be. It seems to me that
> >> /dev/mtd2 simply gives the node info (mtd_debug info )and
> >> /dev/mtdblock2 is really what you want to used. Do I have this
> >> correct?
>
> mtdblock devices are normally only used with the mount/umount commands.
> For erase /dev/mtdX is required - the mtdblock devices don't support the
> required ioctls. Actually, since a while back, it's not necessary to use
> /dev/mtdblockX devices for mount/umount either since they understand
> 'mtdX' directly as in  mount -t cramfs mtd1 /mnt/mountpoint .
>
> mtdblock devices do support an automatic erase-before-write functionality
> when writing. This used to be buggy, don't know the status of this. As fa=
r
> as I'm concerned, it's of little use anyway, because if the image you are
> writing is smaller than the partition, using this feature will leave the
> end of the partition unerased which is probably not what you want. Doing
> separate erase and write operations is thus preferable IMHO.
>
> > Creating 3 MTD partitions on "physmap-flash.0":
> > 0x00000000-0x00040000 : "boot"
> > 0x00040000-0x00200000 : "kernel"
> > 0x00200000-0x00800000 : "cramfs"
> >
> > When I ran mtd_debug I get the following from the above mapping:
> >
> > # mtd_debug info /dev/mtd2
> > mtd.size =3D 1835008 (1M)
> >
> > # mtd_debug info /dev/mtd1
> > mtd.size =3D 262144 (256K)
> >
> > # mtd_debug info /dev/mtd0
> > mtd.size =3D 262144 (256K)
> >
> > # mtd_debug info /dev/mtd3
> > mtd.size =3D 1835008 (1M)
>
> Looks like your minor numbers are screwed up for the /dev/mtd devices. 0
> and 1 seem to have the same size, as to 2 and 3. Normally mtd0 is the
> whole flash, with the first partition being in mtd1 (someone please
> correct me if I'm wrong here). mtd0/1 seems to refer to the first 256k
> boot partition, with mtd2/3 referring to the kernel partition with the
> size of 0x1c0000 =3D 1835008.
>
> What does  ls -l /dev/mtd*  (and ls -l /dev/mtdblock*) say?

It looks like this:

crw-r--r--    1 root     root      90,   0 Mar 22  2005 /dev/mtd0
crw-r--r--    1 root     root      90,   1 Mar 22  2005 /dev/mtd1
crw-r--r--    1 root     root      90,   2 Mar 22  2005 /dev/mtd2
crw-r--r--    1 root     root      90,   3 Mar 22  2005 /dev/mtd3
crw-r--r--    1 root     root      90,   4 Nov 22  2006 /dev/mtd4
brw-r--r--    1 root     root      31,   0 Mar 22  2005 /dev/mtdblock0
brw-r--r--    1 root     root      31,   1 Mar 22  2005 /dev/mtdblock1
brw-r--r--    1 root     root      31,   2 Mar 22  2005 /dev/mtdblock2
brw-r--r--    1 root     root      31,   3 Mar 22  2005 /dev/mtdblock3
brw-r--r--    1 root     root      31,   4 Nov 22  2006 /dev/mtdblock4

I've added the fourth block but that looks the same as the 0 and 1 blocks.


>
> > # mtd_debug erase /dev/mtdblock2 0 0x600000
> > MEMERASE: Inappropriate ioctl for device
>
> You must use /dev/mtd2 for erasure.
>
> > Clearly I'm missing something here. Could someone help me understand th=
is?
>
> The problem seems to have something to do with the device mapping, your
> commands look ok at least to start with.
>
> /Ricard
> --
> Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
>
