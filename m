Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bbjND-0007Q5-S6
 for linux-mtd@lists.infradead.org; Mon, 22 Aug 2016 07:10:20 +0000
Date: Mon, 22 Aug 2016 09:09:47 +0200
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
Message-ID: <20160822090947.01ff9dab@bbrezillon>
In-Reply-To: <57BA7924.506@easystack.cn>
References: <57B6E1BD.1060707@easystack.cn>
 <AL*AZwAyAecQSM1UjjjNxao0.3.1471605640762.Hmail.dongsheng.yang@easystack.cn>
 <20160819135536.1ed9e374@bbrezillon> <57BA7924.506@easystack.cn>
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

On Mon, 22 Aug 2016 12:01:40 +0800
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
> http://www.fujitsu.com/global/about/resources/news/press-releases/2015/11=
19-01.html

Is this solution really using a mainline kernel?
