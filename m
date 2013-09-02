Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGPQr-0001Dy-6t
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2013 08:24:24 +0000
Message-ID: <52244B22.3020605@freescale.com>
Date: Mon, 2 Sep 2013 16:24:02 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Hector Palacios <hector.palacios@digi.com>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <52206C05.8020701@freescale.com>
 <5220AB35.9080409@digi.com> <20130831025344.GA9971@gmail.com>
 <5220B8F6.3080405@digi.com> <20130831033438.GA13704@gmail.com>
 <5220C8C4.5010305@digi.com>
 <CAOMZO5CTQZBmvQc4y761kGHWYWRXr7GwVrTuTPE+JU=bmjq62w@mail.gmail.com>
 <5220CB56.7040505@digi.com> <20130831133728.GA22069@gmail.com>
 <52244886.8060205@digi.com>
In-Reply-To: <52244886.8060205@digi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8802=E6=97=A5 16:12, Hector Palacios =E5=86=
=99=E9=81=93:
>> I think this SLC should be okay with jffs2.
>>
>>>>>
>>>>> The partition now partially mounts (I can see a few of the folders=20
>>>>> and
>>>>> files) but I get thousands of errors like these:
>>>>>
>>>>> [ 118.210985] jffs2: mtd->read(0x100 bytes from 0x0) returned ECC=20
>>>>> error
>>>>> [ 118.255424] jffs2: mtd->read(0x1ff20 bytes from 0xe0) returned=20
>>>>> ECC error
>>>>> [ 118.255561] jffs2: jffs2_scan_inode_node(): CRC failed on node at
>>>>> 0x000001ec: Read 0x00000000, calculated 0xa587e8ba
>>>>> [ 118.255602] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985=20
>>>>> not
>>>>> found at 0x00000234: 0x1cf7 instead
>>>>
>>>> This error is most likely because you generated a jffs2 rootfs with =
a
>>>> eraseblock size that does not match the one of your NAND device.
>>>
>>> No. I used 128k erase block that matches my NAND. I also checked
>>> that I can mount the jffs2 partition correctly using my v2.6.35
>>> kernel, so the partition seems to be correctly written.
>>>
>>
>> Please use following steps and try again:
>> flash_eraseall /dev/mtdx
>> mount -t jffs2 /dev/mtdblockx tmp
>
> What's the purpose of this?
> This works and doesn't output any error but it's mounting an erased=20
> partition.
Please test the patch set after you have erased a partition. Since the=20
ECC layout may be changed after applying this
patch set.

So You may meet some errors if you do not do so.



>
> > Keep the JFFS2_FS_DEBUG is 0.
> > and test it again.
>
> JFFS2_FS_DEBUG is 0. The error messages above are printed nevertheless=20
> because they are pr_notice() calls, not jffs2_dbg().
this is just a suggestiong. ignore this if you do not meet any error by=20
following above steps.

thanks
Huang Shijie
