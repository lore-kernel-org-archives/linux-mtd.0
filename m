Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baiP0-0006zB-Ax
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 11:56:02 +0000
Date: Fri, 19 Aug 2016 13:55:36 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?5p2o5Lic5Y2H?= <dongsheng.yang@easystack.cn>
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 fabf@skynet.be, jesper.nilsson@axis.com, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>, linux-cris-kernel@axis.com,
 shengyong1@huawei.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Dongsheng Yang <dongsheng081251@gmail.com>, dmitry.torokhov@gmail.com,
 dooooongsheng.yang@gmail.com, jschultz@xes-inc.com, starvik@axis.com,
 mtownsend1973@gmail.com, linux-mtd@lists.infradead.org, Colin King
 <colin.king@canonical.com>, asierra@xes-inc.com, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: MTD RAID
Message-ID: <20160819135536.1ed9e374@bbrezillon>
In-Reply-To: <AL*AZwAyAecQSM1UjjjNxao0.3.1471605640762.Hmail.dongsheng.yang@easystack.cn>
References: <57B6E1BD.1060707@easystack.cn>
 <AL*AZwAyAecQSM1UjjjNxao0.3.1471605640762.Hmail.dongsheng.yang@easystack.cn>
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

On Fri, 19 Aug 2016 19:20:40 +0800 (GMT+08:00)
=E6=9D=A8=E4=B8=9C=E5=8D=87 <dongsheng.yang@easystack.cn> wrote:

> Hi guys,Sorry I think i did not express myself clearly. From this referen=
ce:=20
>=20
>=20
> https://linas.org/linux/Software-RAID/Software-RAID.txt
>=20
>=20
> we can see, RAID stands for "Redundant Array of Inexpensive Disks"
> and is meant to be a way of creating a fast and reliable
> disk-drive subsystem out of individual disks. In the PC
> world, "I" has come to stand for "Independent".
>=20
>=20
> There are two benifets in RAID, "fast" and "reliable".=20
> So I=E3=80=80introduce the RAID framework in MTD world. and implement
> 3 types of RAID currently.
>=20
>=20
> (1) single: I reuse this work same with what it is in BTRFS.
> It's not a standard RAID level. But just concat the devices.
>=20
>=20
> (2) RAID0: also known as Striping mode. This can make device faster.
> From what I show in my first email, we can see we can get 51.1 MB/s in dd
> although the original device is only 14.0 MB/s.=20

Some comments on your results. It's all theoretical (based on nandsim),
and assuming your NAND chips are connected to the same NAND controller
you would just get the same perf as in 'single' mode (accesses through
the NAND controller are currently serialized, that's something I'm
trying to change but it's not here yet).

So yes, in an ideal word, sequential accesses would be improved, but
we're not here yet. BTW, did you run this test on a real HW?

>=20
>=20
> (3) RAID1: also known as Mirroring mode. This can make device more reliab=
le.=20
> Yes, Boris pointed out that there could be some problems if we are using =
NAND flash.
> But I think these all are possible to be solved. And I don't think this i=
s the problem of=20
> MTD RAID, but the problem of the special use case of NAND. I am glad to m=
ake the
> MTD RAID working better on MLC and TLC.

It's not only an MLC/TLC problem, it's just that you're more likely to
see it on MLC/TLC NANDs. The fact that you're not regularly
reading/refreshing some blocks of the mirror MTD is a real problem, and
this lead to the safety illusion I was mentioning in my previous answer.

That's why I think implementing RAID on top of raw MTD devices is a bad
idea.

>=20
>=20
> In addition, there are some more RAID levels, such as RAID10, RAID4/5/6. =
All of them are
> useful for "fast" and "reliable".

I'm not saying RAID is useless, I'm just saying it's a pain to
implement on top of MTD devices.

>=20
>=20
> I hope this mail helps to express my idea here.=20
>

I think I got the main idea, and I already explained why I think it's
not a good idea. If you still want to go this road then you'll have to
convince me that your implementation is safe (which is not the case
yet).

BTW, think about that: if you use an SSD in a RAID setting, the SSD's
FTL is taking care of the NAND unreliability problems. Here you're just
ignoring these problems and are assuming doing RAID on a NAND is just
as safe as doing RAID on an SSD, which is wrong.
If you want to be in a 'similar' setting, then the RAID array has to
operate on top of the FTL/WL layer (in this specific case, UBI).
