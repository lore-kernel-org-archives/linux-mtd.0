Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3lbV-0008Q6-NN
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 10:22:34 +0000
Message-ID: <503361C3.30308@freescale.com>
Date: Tue, 21 Aug 2012 18:24:03 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: another issue with ubifs on v3.6-rc2: attaching an formatted
 device
References: <20120820160750.GS2232@pengutronix.de>
 <1345489867.1789.3.camel@kyv> <20120821093518.GD12220@pengutronix.de>
In-Reply-To: <20120821093518.GD12220@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B408=E6=9C=8821=E6=97=A5 17:35, Uwe Kleine-K=C3=B6ni=
g =E5=86=99=E9=81=93:
> On Mon, Aug 20, 2012 at 10:11:07PM +0300, Artem Bityutskiy wrote:
>> On Mon, 2012-08-20 at 18:07 +0200, Uwe Kleine-K=C3=B6nig wrote:
>>> [  163.714143] uncorrectable error :
>>> [  163.727597] UBI warning: ubi_io_read: error -74 (ECC error) while
>>> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
>>> [  163.740737] uncorrectable error :
>>> [  163.744032] UBI warning: ubi_io_read: error -74 (ECC error) while
>>> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
>>> [  163.757119] uncorrectable error :
>>> [  163.760487] UBI warning: ubi_io_read: error -74 (ECC error) while
>>> reading 64 bytes from PEB 0:0, read only 64 bytes, retry
>>> [  163.774427] uncorrectable error :
>>> [  163.777808] UBI error: ubi_io_read: error -74 (ECC error) while
>>> reading 64 bytes from PEB 0:0, read 64 bytes
>> This looks like your flash does not really support sub-pages while
>> declares that it does. Check it with MTD subpage test.
> the subpages test fails with:
>
> [   82.435792] mtd_subpagetest: written up to eraseblock 7424
> [   82.905775] mtd_subpagetest: written up to eraseblock 7680
> [   83.375201] mtd_subpagetest: written up to eraseblock 7936
> [   83.840447] mtd_subpagetest: written 8192 eraseblocks
> [   83.845522] mtd_subpagetest: verifying all eraseblocks
> [   83.852740] uncorrectable error :
> [   83.856086] mtd_subpagetest: error: read failed at 0x0
> [   83.861469] mtd_subpagetest: error -74 occurred
> [   83.866093] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> Error: could not insert module ./drivers/mtd/tests/mtd_subpagetest.ko: =
Bad message
The mx35 does not use the gpmi nand driver, but the mxc-nand driver.

So I have no idea about this issue too. I do not know whether the=20
mxc-nand support the subpage writes or not.

Best Regards
Huang Shijie
> I don't have a clue yet how to debug that further. Will start with
> checking older kernel releases. Any hints welcome.
>
> Best regards
> Uwe
>
