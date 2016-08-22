Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bbjKd-0006jw-Fd
 for linux-mtd@lists.infradead.org; Mon, 22 Aug 2016 07:07:42 +0000
Date: Mon, 22 Aug 2016 09:07:06 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Dongsheng Yang <dongsheng.yang@easystack.cn>
Cc: starvik@axis.com, jesper.nilsson@axis.com, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>, shengyong1@huawei.com,
 linux-cris-kernel@axis.com, dedekind1@gmail.com, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Ard
 Biesheuvel <ard.biesheuvel@linaro.org>, dooooongsheng.yang@gmail.com,
 jschultz@xes-inc.com, fabf@skynet.be, mtownsend1973@gmail.com,
 linux-mtd@lists.infradead.org, Colin King <colin.king@canonical.com>,
 asierra@xes-inc.com, dmitry.torokhov@gmail.com, Dongsheng Yang
 <dongsheng081251@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: MTD RAID
Message-ID: <20160822090706.6ec92340@bbrezillon>
In-Reply-To: <57BA6FFA.6000601@easystack.cn>
References: <57B6E1BD.1060707@easystack.cn>
 <AL*AZwAyAecQSM1UjjjNxao0.3.1471605640762.Hmail.dongsheng.yang@easystack.cn>
 <20160819135536.1ed9e374@bbrezillon>
 <57BA6FFA.6000601@easystack.cn>
MIME-Version: 1.0
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

On Mon, 22 Aug 2016 11:22:34 +0800
Dongsheng Yang <dongsheng.yang@easystack.cn> wrote:

> On 08/19/2016 07:55 PM, Boris Brezillon wrote:
> > On Fri, 19 Aug 2016 19:20:40 +0800 (GMT+08:00)
> > =E6=9D=A8=E4=B8=9C=E5=8D=87 <dongsheng.yang@easystack.cn> wrote:
> > =20
> >> Hi guys,Sorry I think i did not express myself clearly. From this refe=
rence:
> >>
> >>
> >> https://linas.org/linux/Software-RAID/Software-RAID.txt
> >>
> >>
> >> we can see, RAID stands for "Redundant Array of Inexpensive Disks"
> >> and is meant to be a way of creating a fast and reliable
> >> disk-drive subsystem out of individual disks. In the PC
> >> world, "I" has come to stand for "Independent".
> >>
> >>
> >> There are two benifets in RAID, "fast" and "reliable".
> >> So I=E3=80=80introduce the RAID framework in MTD world. and implement
> >> 3 types of RAID currently.
> >>
> >>
> >> (1) single: I reuse this work same with what it is in BTRFS.
> >> It's not a standard RAID level. But just concat the devices.
> >>
> >>
> >> (2) RAID0: also known as Striping mode. This can make device faster.
> >>  From what I show in my first email, we can see we can get 51.1 MB/s i=
n dd
> >> although the original device is only 14.0 MB/s. =20
> > Some comments on your results. It's all theoretical (based on nandsim),
> > and assuming your NAND chips are connected to the same NAND controller
> > you would just get the same perf as in 'single' mode (accesses through
> > the NAND controller are currently serialized, that's something I'm
> > trying to change but it's not here yet).
> >
> > So yes, in an ideal word, sequential accesses would be improved, but
> > we're not here yet. BTW, did you run this test on a real HW? =20
>=20
> Of course, we got a great performance in our production. And yes,
> we have 16 control channels with 256 nand chips.
> > =20
> >>
> >> (3) RAID1: also known as Mirroring mode. This can make device more rel=
iable.
> >> Yes, Boris pointed out that there could be some problems if we are usi=
ng NAND flash.
> >> But I think these all are possible to be solved. And I don't think thi=
s is the problem of
> >> MTD RAID, but the problem of the special use case of NAND. I am glad t=
o make the
> >> MTD RAID working better on MLC and TLC. =20
> > It's not only an MLC/TLC problem, it's just that you're more likely to
> > see it on MLC/TLC NANDs. The fact that you're not regularly
> > reading/refreshing some blocks of the mirror MTD is a real problem, and
> > this lead to the safety illusion I was mentioning in my previous answer.
> >
> > That's why I think implementing RAID on top of raw MTD devices is a bad
> > idea. =20
>=20
> Let me copy the topics from other thread here.
>=20
>  >> Sorry, I am afraid I did not get your point. But in general, it's  =20
> safer to
>  >> have two copies of data than just one copy of it I believe. Could you
>  >> explain
>  >> more , thanx. :) =20
>=20
>  > It's safer in most cases, but if you don't make sure your mirror is
>  > in a correct state, then it's just giving an illusion of safety, which
>  > is not necessarily here.' =20
>=20
> Actually, I would say, MTD RAID is working on upper level than what you
> are worrying. RAID-1 does not care about what the problem happened
> in the MTD device. What it want to do is just make the data safer. it save
> more copies of data in different MTD devices.
>=20
> IOW, it is totally different with other idea such as "paired pages" to so=
lve
> the MLC problem. It protect data from disk failure, but don't care about
> what's the disk failure. Even because one MTD device are destroyed
> by a bullet.
>=20
> So, it's really really not a replacement for "paired pages" or other=20
> solution
> for MLC reliability. It works on upper on them. I think we should get an
> agreement at first about what should/can MTD RAID do.

Except the code supposed to deal with MLC constraints is placed in UBI,
so as I said, you're putting your RAID layer on something that is not
and will never be reliable.

>=20
> > =20
> >>
> >> In addition, there are some more RAID levels, such as RAID10, RAID4/5/=
6. All of them are
> >> useful for "fast" and "reliable". =20
> > I'm not saying RAID is useless, I'm just saying it's a pain to
> > implement on top of MTD devices.
> > =20
> >>
> >> I hope this mail helps to express my idea here.
> >> =20
> > I think I got the main idea, and I already explained why I think it's
> > not a good idea. If you still want to go this road then you'll have to
> > convince me that your implementation is safe (which is not the case
> > yet).
> >
> > BTW, think about that: if you use an SSD in a RAID setting, the SSD's
> > FTL is taking care of the NAND unreliability problems. Here you're just
> > ignoring these problems and are assuming doing RAID on a NAND is just
> > as safe as doing RAID on an SSD, which is wrong.
> > If you want to be in a 'similar' setting, then the RAID array has to
> > operate on top of the FTL/WL layer (in this specific case, UBI). =20
>=20
> As I explained above, MTD RAID is not just a solution for reliability
> problem for MLC/TLC.
>=20
> Yes, SSD solved the problem of reliability problem of flash. But please
>   think about why we should software-RAID in md? Because RAID is not
> used to solve such problems. we don't care about what exactly problem
> of each device, just improve yourself as you want. we are working on
> an upper level, protecting data even your device are destroyed by a hamme=
r.

Exactly what I say: RAID is not robust against NAND reliability
issues, so you should not try to put a SW-RAID layer of top of raw
NANDs, otherwise the RAID layer is likely to be impacted by those
problems, and UBI won't be able to do its job correctly (see my
comments on how the RAID layer will hide the mirror device).
