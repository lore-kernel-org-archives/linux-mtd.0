Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmPMu-0005KK-Mq
 for linux-mtd@lists.infradead.org; Tue, 20 Sep 2016 18:02:09 +0000
Received: by mail-wm0-x242.google.com with SMTP id b184so4666929wma.3
 for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2016 11:01:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160920182539.2ca3778c@bbrezillon>
References: <1474054432-29124-1-git-send-email-ricardo.ribalda@gmail.com>
 <20160920182539.2ca3778c@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 20 Sep 2016 20:01:26 +0200
Message-ID: <CAPybu_02pTOkfqKW2D4mNvK5fGWq9uTiOUw9rvs1Fa+gWNLh+g@mail.gmail.com>
Subject: Re: [PATCH v5] mtd: spi-nor: Add support for S3AN spi-nor devices
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Stephen Warren <swarren@nvidia.com>,
 Jagan Teki <jteki@openedev.com>, Vignesh R <vigneshr@ti.com>,
 Marek Vasut <marex@denx.de>,
 =?UTF-8?Q?Ezequiel_Garc=C3=ADa?= <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Furquan Shaikh <furquan@google.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris

On Tue, Sep 20, 2016 at 6:25 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

>>       while (len) {
>> -             ret = nor->read(nor, from, len, buf);
>> +             loff_t addr = from;
>> +
>> +             if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
>> +                     addr = spi_nor_s3an_addr_convert(nor, addr);

That should not be an issue, the bigest s3an is  less than 4 MBytes :)

Thanks for your review



-- 
Ricardo Ribalda
