Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBUtr-00037l-Qq
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 20:50:48 +0000
Received: by mail-lb0-f170.google.com with SMTP id 10so10062473lbg.1
 for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2015 12:50:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150114010459.GB10784@hsj.sh.intel.com>
References: <1421187255-20618-1-git-send-email-festevam@gmail.com>
 <20150114010459.GB10784@hsj.sh.intel.com>
Date: Wed, 14 Jan 2015 14:50:25 -0600
Message-ID: <CAHrpEqSxs_-dOqT6JpJGcTC5r7wF8-b2nrS30OS2DLC8z1nAqw@mail.gmail.com>
Subject: Re: [PATCH RESEND] mtd: fsl-quadspi: Fix module unbound
From: Zhi Li <lznuaa@gmail.com>
To: Huang Shijie <shijie.huang@intel.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "Frank.Li@freescale.com" <Frank.Li@freescale.com>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 han.xu@freescale.com, Brian Norris <computersforpeace@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 13, 2015 at 7:04 PM, Huang Shijie <shijie.huang@intel.com> wrote:
> On Tue, Jan 13, 2015 at 08:14:15PM -0200, Fabio Estevam wrote:
>> From: Fabio Estevam <fabio.estevam@freescale.com>
>>
>> When removing the fsl-quadspi module and running 'cat /proc/mtd' afterwards,
>> we see garbage data like:
>>
>> $ rmmod  fsl-quadspi
>> $ cat /proc/mtd
>> dev:    size   erasesize  name
>> mtd0: 00000000 00000000 "(null)"
>> mtd0: 00000000 00000000 "(null)"
>> mtd0: 00000000 00000000 "(null)"
>> ...
>> mtd0: a22296c6c756e28 00000000 "(null)"
>> mtd0: a22296c6c756e28 3064746d "(null)"
>>
>> If we continue doing multiple module load/unload operations, then it will also
>> lead to a kernel crash.
>>
>> The reason for this is due to the wrong mtd index used in
>> mtd_device_unregister() in the remove function.
>>
>> We need to keep the mtd unregister index aligned with the one used in the probe
>> function, which means we need to take into account the 'has_second_chip'
>> property. By doing so we can guarantee that the mtd index is the same in the
>> registration and unregistration functions.
>>
>> With this patch applied we can load/unload the fsl-quadspi driver several times
>> and it will result in no crash.
>>
>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ok. Let this patch in.
>
> Acked-by: Huang Shijie <shijie.huang@intel.com>

Tested-by: Frank Li <Frank.Li@freescale.com>

>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
