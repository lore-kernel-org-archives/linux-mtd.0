Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1be12P-0004uk-Cc
 for linux-mtd@lists.infradead.org; Sun, 28 Aug 2016 14:26:18 +0000
Received: by mail-wm0-x22e.google.com with SMTP id f65so47956783wmi.0
 for <linux-mtd@lists.infradead.org>; Sun, 28 Aug 2016 07:25:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160828162059.629f4fdf@bbrezillon>
References: <20160827194326.GA1817@makrotopia.org>
 <CAAEAJfA5zgJDGm=Vdewxb8nh-n-7Ez-HWGCORHyGvD_ku1YxLA@mail.gmail.com>
 <20160828162059.629f4fdf@bbrezillon>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 28 Aug 2016 11:25:54 -0300
Message-ID: <CAAEAJfCL47DxHOYrXEUXaZQNvaPEvN3P9VVGihA-KnJ3dNVU7g@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, lede-dev@lists.infradead.org,
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

On 28 August 2016 at 11:20, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Sun, 28 Aug 2016 11:12:50 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>
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
>> >
>>
>> And you would like to do:
>>
>> * for UBIFS: ubi.mtd=3Dubi root=3Dubi0:rootfs rootfstype=3Dubifs
>> * for squashfs: ubi.mtd=3Dubi root=3D/dev/ubiblock0_1 rootfstype=3Dsquas=
hfs
>
> I think Daniel wants something like:
>
> ubi.mtd=3D1 root=3Dubi0:rootfs
>
> or
>
> ubi.mtd=3D1 root=3D/dev/ubiblock0_1
>
> to work for both the UBIFS and squashfs cases.
>

Right. In which case, I was going to propose the same thing
you just did! It would be simple, and uninvasive to introduce
something like the parameter you suggested
"ubi.block=3Dattach_all_ro_vols".

After all, this is what mtdblock does, so it wouldn't be
a too revolutionary approach.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
