Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TG4bX-0006kq-1Y
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2012 09:05:27 +0000
Received: by lbbgf7 with SMTP id gf7so6330830lbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 24 Sep 2012 02:05:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <505F1D34.3040407@gmail.com>
References: <1348401683-15698-1-git-send-email-hechtb@gmail.com>
 <505F1D34.3040407@gmail.com>
Date: Mon, 24 Sep 2012 11:05:24 +0200
Message-ID: <CABYn4syrqMwJr8Hu2qy3P6cmooc8jDi-Xh7n4Pf63pyYS1tgZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: sh_flctl: Setup and release DMA channels
From: Bastian Hecht <hechtb@googlemail.com>
To: Vikram Narayanan <vikram186@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/23 Vikram Narayanan <vikram186@gmail.com>:
> On 9/23/2012 5:31 PM, Bastian Hecht wrote:
>>
>> The code probes if DMA channels can get allocated and tears them down at
>> removal/failure if needed.
>>
>> Based on Guennadi Liakhovetski's code from the sh_mmcif driver.
>>
>>
>> +void flctl_setup_dma(struct sh_flctl *flctl)
>
>
> static?
>
> ~Vikram

Oh yes, thanks!
