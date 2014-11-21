Received: from mail-wg0-f54.google.com ([74.125.82.54])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xrmmg-00060I-HB
 for linux-mtd@lists.infradead.org; Fri, 21 Nov 2014 11:53:55 +0000
Received: by mail-wg0-f54.google.com with SMTP id y10so6315408wgg.13
 for <linux-mtd@lists.infradead.org>; Fri, 21 Nov 2014 03:53:30 -0800 (PST)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Message-ID: <546F2754.6090509@imgtec.com>
Date: Fri, 21 Nov 2014 08:51:48 -0300
MIME-Version: 1.0
To: =?ISO-2022-JP?B?IlFpIFdhbmcgGyRCMiY1LxsoQiAocWl3YW5nKSI=?=
 <qiwang@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "arnaud.mouiche@invoxia.com" <arnaud.mouiche@invoxia.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
References: <mailman.22397.1416508326.22890.linux-mtd@lists.infradead.org>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7713225E@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <71CF8D7F32C5C24C9CD1D0E02D52498A7713225E@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Cc: "ionela.voinescu@imgtec.com" <ionela.voinescu@imgtec.com>,
 James Hartley <james.hartley@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 11/20/2014 10:16 PM, Qi Wang 王起 (qiwang) wrote:
>> On 11/20/2014 10:18 AM, Ezequiel Garcia wrote:
>> Hm, perhaps it's better to rely in the NAND core code and avoid that BBT
>> and ECC code handling duplication?
>>
>> Ionela and I are preparing an SPI NAND framework, but it's far from
>> ready yet, so if you have something to submit, please do so :)
> 
> Yes, duplicate BBT and ECC code from nand code do is not a good idea.
> But SPI NAND framework should be a standalone module in MTD, might cause
> chaos if it still rely on NAND core code, that is my only concern.

Any reasons why you think it should be a standalone MTD driver?

Why do you say it'd case chaos?

> How do you think?
> 

Yeah, I've been thinking about this for some time. Right now, I think that
SPI NAND is just that: a NAND over SPI, so I'm doing some experiments
around this design:

    Userspace
  ------------------
    MTD
  ------------------
    NAND core
  ------------------
    SPI NAND core
  ------------------
    SPI NAND device
  ------------------
    SPI core
  ------------------
    SPI master
  ------------------
    Hardware

-- 
Ezequiel
