Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQv5T-0001Mw-6l
 for linux-mtd@lists.infradead.org; Sun, 16 Aug 2015 10:22:48 +0000
Received: by lahi9 with SMTP id i9so63781624lah.2
 for <linux-mtd@lists.infradead.org>; Sun, 16 Aug 2015 03:20:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF44A3D@NTXXIAMBX02.xacn.micron.com>
References: <cover.1439543572.git.hramrach@gmail.com>
 <A765B125120D1346A63912DDE6D8B6310BF44A3D@NTXXIAMBX02.xacn.micron.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Sun, 16 Aug 2015 12:20:15 +0200
Message-ID: <CAOMqctTQjA5S9ZnR-k5+jFyTOAc-wvWG1mS_21OmJYmtCP+UiA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add spi-nor SPI transfer error handling
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Cc: Hou Zhiqiang <B48286@freescale.com>,
 "shijie.huang@intel.com" <shijie.huang@intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 =?UTF-8?B?UmFmYcOF4oCaIE1pw4XigJplY2tp?= <zajec5@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>, Marek Vasut <marex@denx.de>,
 Gabor Juhos <juhosg@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hello,

On 15 August 2015 at 03:51, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (beanhuo) =
<beanhuo@micron.com> wrote:
>>Hello,
>
>>with these patches SPI transfer errors are not silently ignored but rathe=
r reported to spi-nor users.
>
>>This should prevent silently dropping data to the floor in cases when the=
 SPI transfer fails and the failure is detected.
>
>>It has been pointed out that MTD users do not handle the case when data i=
s read only partially so this version adds the last patch which handles thi=
s in spi-nor.
>
>>Thanks
>
>>Michal
>  Seems parallel nand read/write also has the same condition.

I am not familiar with parallel NAND drivers so I have no idea if
parallel nand can fail in similar way.

As I understand it the parallel nand controller is dedicated piece of
hardware just for accessing the nand so there may not be any problems
similar to what the generic SPI bus has.

Thanks

Michal
