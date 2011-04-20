Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCMle-00033f-0g
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 02:03:46 +0000
Received: by vws8 with SMTP id 8so292654vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Apr 2011 19:03:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303103035.2815.4.camel@localhost>
References: <AANLkTin9=ADCP4OQH8Y=6ZKo6CGwTWODz95eUuRsT355@mail.gmail.com>
	<AANLkTimO9guyhUUk8D7i-K=Tt4wF8d+mfFoV29mOZoeD@mail.gmail.com>
	<BANLkTimYunfWMLejECBC5gCJzCtSv_bTCA@mail.gmail.com>
	<1303103035.2815.4.camel@localhost>
Date: Wed, 20 Apr 2011 10:03:43 +0800
Message-ID: <BANLkTin0-vPhMSQ0Vy=V07aQ1T+KrRB7zg@mail.gmail.com>
Subject: Re: [nandsim] how to rmmod nandsim or get to know who is using it
From: zheng shi <neversetsun@gmail.com>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com
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

Artem,
I can't rmmod mtdblock either since it's also in use but have no known user=
.
Please have a check of my lsmod result below.

Would you please have a try if nandsim can be rmmod after installation?
2.6.35 and mtd-2.6 git tree has such problem but 2.6.32 has no such problem=
.
Could it be caused by VFS change?

Thanks!

pc:~$ uname -a
Linux pc 2.6.35.9 #2 SMP Tue Mar 29 00:30:21 CST 2011 i686 GNU/Linux
pc:~$ lsmod
Module                  Size  Used by
mtdblock                2985  1
mtd_blkdevs             4787  1 mtdblock
mtdchar                 7514  0
nandsim                28682  1
nand                   34487  1 nandsim
nand_ecc                3938  1 nand
nand_ids                2903  2 nandsim,nand
mtd                    18747  7 mtd_blkdevs,mtdchar,nandsim,nand

On Mon, Apr 18, 2011 at 1:03 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Fri, 2011-04-15 at 01:11 +0800, zheng shi wrote:
>> Hi All,
>> After mtdblock is installed, someone is using nandsim module.
>> But I don't know who is using it.
>> I have used lsof to check if there's any possible user.
>> There's no such problem with linux-2.6.32.
>
> I think this is mtdblock. did you try to rmmod mtdblock?
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>



--=20
Regards, Shizheng
