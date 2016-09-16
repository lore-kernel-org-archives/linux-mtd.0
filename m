Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkypw-0000F1-6w
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 19:30:12 +0000
Received: by mail-wm0-x235.google.com with SMTP id l132so54426015wmf.0
 for <linux-mtd@lists.infradead.org>; Fri, 16 Sep 2016 12:29:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2911e5b9-281e-b603-0739-b6afb827055a@atmel.com>
References: <1468527505-22767-1-git-send-email-ricardo.ribalda@gmail.com>
 <2911e5b9-281e-b603-0739-b6afb827055a@atmel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 16 Sep 2016 21:29:29 +0200
Message-ID: <CAPybu_2CuX2mC4ensJFLz0ydicLV3b3ypNEruO3Z4s3fSyo5+Q@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: spi-nor: Add support for S3AN spi-nor devices
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
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

Hi Cyrille

Thanks for your comments. I am sending v5 with all of them (hopefully) fixed.

On Fri, Sep 16, 2016 at 6:33 PM, Cyrille Pitchen
<cyrille.pitchen@atmel.com> wrote:
>> +             else {
>> +                     uint64_t aux = to;
> what about i ?
do_div explicitly requires uint64_t on some arches, I got some errors
from the autobuilder if I just used i.


Thanks for your comments!
