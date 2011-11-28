Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RUp0n-0005Oe-RQ
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2011 00:23:59 +0000
Received: by yenq4 with SMTP id q4so2057114yen.36
 for <linux-mtd@lists.infradead.org>; Sun, 27 Nov 2011 16:23:52 -0800 (PST)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <CAOesGMhA0pwfeHEsrAHYZBbpaXFSO-jF-ZUyrVP48wwPbBGj_A@mail.gmail.com>
References: <1322397903.2799.5.camel@phoenix>
 <CAOesGMhA0pwfeHEsrAHYZBbpaXFSO-jF-ZUyrVP48wwPbBGj_A@mail.gmail.com>
Date: Mon, 28 Nov 2011 09:23:51 +0900
Message-ID: <CAH9JG2U=vu6a1Gw_jCwE5Gmq1BOsd=HTb4CvefgsAcufYosmGA@mail.gmail.com>
Subject: Re: [PATCH] mtd: convert drivers/mtd/* to use module_platform_driver()
From: Kyungmin Park <kyungmin.park@samsung.com>
To: Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Sukumar Ghorai <s-ghorai@ti.com>, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
 Jamie Iles <jamie@jamieiles.com>, Axel Lin <axel.lin@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For OneNAND parts

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
On 11/28/11, Olof Johansson <olof@lixom.net> wrote:
> On Sun, Nov 27, 2011 at 4:45 AM, Axel Lin <axel.lin@gmail.com> wrote:
>> This patch converts the drivers in drivers/mtd/* to use the
>> module_platform_driver() macro which makes the code smaller and a bit
>> simpler.
>>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: Jiandong Zheng <jdzheng@broadcom.com>
>> Cc: Scott Branden <sbranden@broadcom.com>
>> Cc: Wan ZongShun <mcuos.com@gmail.com>
>> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> Cc: Jamie Iles <jamie@jamieiles.com>
>> Cc: Olof Johansson <olof@lixom.net>
>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
>> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>> Cc: Ralf Baechle <ralf@linux-mips.org>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: Lars-Peter Clausen <lars@metafoo.de>
>> Cc: Manuel Lauss <manuel.lauss@googlemail.com>
>> Cc: Vimal Singh <vimal.newwork@gmail.com>
>> Cc: Andres Salomon <dilinger@queued.net>
>> Cc: Sukumar Ghorai <s-ghorai@ti.com>
>> Signed-off-by: Axel Lin <axel.lin@gmail.com>
>
> Acked-by: Olof Johansson <olof@lixom.net>   (pasemi portions)
>
>
> -Olof
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
