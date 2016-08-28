Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1be1UM-0005u1-LT
 for linux-mtd@lists.infradead.org; Sun, 28 Aug 2016 14:55:12 +0000
Received: by mail-wm0-x22a.google.com with SMTP id i5so56286231wmg.0
 for <linux-mtd@lists.infradead.org>; Sun, 28 Aug 2016 07:54:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160828142747.GD1623@makrotopia.org>
References: <20160827194326.GA1817@makrotopia.org>
 <CAAEAJfA5zgJDGm=Vdewxb8nh-n-7Ez-HWGCORHyGvD_ku1YxLA@mail.gmail.com>
 <20160828142747.GD1623@makrotopia.org>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 28 Aug 2016 11:54:47 -0300
Message-ID: <CAAEAJfDskDWuaZXuT0sSg7nyPOSZWD6ZFT+gc59BoQ45yuC8bA@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
To: Daniel Golle <daniel@makrotopia.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 lede-dev@lists.infradead.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Zoltan HERPAI <wigyori@uid0.hu>, Hauke Mehrtens <hauke@hauke-m.de>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 openwrt-devel@lists.openwrt.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28 August 2016 at 11:27, Daniel Golle <daniel@makrotopia.org> wrote:
> Hi Ezequiel,
>
> On Sun, Aug 28, 2016 at 11:12:50AM -0300, Ezequiel Garcia wrote:
>> Daniel,
>>
>> Let's try to tackle this from a different angle.
>>
>> On 27 August 2016 at 16:43, Daniel Golle <daniel@makrotopia.org> wrote:
>> > Hi!
>> >
>> > In an attempts to fix the flaws of the current set of UBI-related
>> > patches we are carrying in OpenWrt, I re-wrote the way mounting the
>> > rootfs from UBI in OpenWrt/LEDE works. The main requirement I face
>> > which cannot be easily addressed using other means which are already
>> > available in the kernel is the fact that UBIFS and squashfs-on-UBI
>> > require different parameters to be set on the cmdline, e.g.
>> > for UBIFS: ubi.mtd=3Dubi root=3Dubi0:rootfs rootfstype=3Dubifs
>> > for squashfs: ubi.mtd=3Dubi ubiblock=3D0,1 root=3D/dev/ubiblock0_1 roo=
tfstype=3Dsquashfs
>> >
>>
>> Can you help me understand the problem you are solving here?
>>
>> So you currently need to do:
>>
>> * for UBIFS: ubi.mtd=3Dubi root=3Dubi0:rootfs rootfstype=3Dubifs
>> * for squashfs: ubi.mtd=3Dubi ubi.block=3D0,1 root=3D/dev/ubiblock0_1
>> rootfstype=3Dsquashfs
>>
>> [..]
>> >
>> > With those changes, a single set of cmdline parameters is
>> > sufficient to mount either UBIFS or any other block filesystem
>> > by creating a ubiblock device:
>> > ubi.mtd=3Dubi root=3Dubi0:rootfs rootfstype=3Dubifs,squashfs
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      this is the goal state :)
>
>> >
>>
>> And you would like to do:
>>
>> * for UBIFS: ubi.mtd=3Dubi root=3Dubi0:rootfs rootfstype=3Dubifs
>> * for squashfs: ubi.mtd=3Dubi root=3D/dev/ubiblock0_1 rootfstype=3Dsquas=
hfs
>
> I do NOT want to pass different cmdlines depending on the filesystem
> type. The lines quote above were to illustrate the current
> inconsistency of cmdline parameters.
>
>>
>> So the only thing you are trying to acomplish, is removal
>> of the ubi.block parameter needed to create ubi block devices.
>>
>> Is that correct?
>
> Almost. I want a single syntax for rootfs=3D to refer to the rootfs
> volume, no matter what the filesystem type is. Hence, in case of
> non-UBIFS filesystem, a ubiblock needs to be created and mounted.
>

Hm, OK. So, if you _actually_ want to do something like:

ubi.mtd=3Dubi root=3Dubi0:rootfs rootfstype=3Dsquashfs

Then you are ** doomed **

I guess you already understand this, but just for the
sake of it, bare with me going through the obvious:

The squashfs works on top of a block device, and so it has
absolutely NO idea about the block device belonging
to a given volume.

The "root=3Dubi0:rootfs" is understood by the filesystem,
in this case ubifs, so it can't be understood by squashfs.

And you can add any amount of pretty hacks to squashfs
or to init/do_mounts.c, but as far as I can see, they will
always be hacks and they will always be rejected.

The reason for this is that kenel code would be very
hard to maintain if each $user that wanted some
special thing to work for a given use case would be
allowed to hack its own special rule.

The kernel is already hard to maintain as it is.
I don't even want to think what it would look like
if maintainers would accept proposals like this one.

Sorry,
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
