Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDzfs-0000w4-Kj
 for linux-mtd@lists.infradead.org; Thu, 25 May 2017 20:48:02 +0000
Received: by mail-wm0-x242.google.com with SMTP id d127so55748911wmf.1
 for <linux-mtd@lists.infradead.org>; Thu, 25 May 2017 13:47:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170525192515.GA114788@google.com>
References: <1492860013-20848-1-git-send-email-andrea.adami@gmail.com>
 <1492860013-20848-4-git-send-email-andrea.adami@gmail.com>
 <20170525192515.GA114788@google.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 25 May 2017 22:47:37 +0200
Message-ID: <CAAQYJAt0L=swoZhD+2nx7NQ+nCxGWh-71g2wgJsK=72nu=z18g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: nand: tmio_nand.c: prefer sharpslpart MTD
 partition parser
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 25, 2017 at 9:25 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Sat, Apr 22, 2017 at 01:20:13PM +0200, Andrea Adami wrote:
>> This is the specific parser for Sharp SL Series (Zaurus)
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  drivers/mtd/nand/tmio_nand.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
>> index fc5e773..f3612ac 100644
>> --- a/drivers/mtd/nand/tmio_nand.c
>> +++ b/drivers/mtd/nand/tmio_nand.c
>> @@ -357,6 +357,8 @@ static void tmio_hw_stop(struct platform_device *dev, struct tmio_nand *tmio)
>>               cell->disable(dev);
>>  }
>>
>> +static const char * const probes[] = { "sharpslpart", NULL };
>
> This breaks anyone who might have used (or might want to use) the ofpart
> or cmdlinepart parsers. At a minimum, you need to include those in your
> array here.

I have been under the wrong assumption there is cmdlinepart as last
option (if compiled) so I have taken a wrong example.
Grepping in /mt for probes gives many examples: what if I change it with

static const char * const probes[] = { "sharpslpart", "cmdlinepart", NULL };

ofpart is utopic at the moment: these machines are not yet converted
to devicetree and it will take a while.

With this patchset we can move a step forward DT, removing all the
static partition definition from spitz.c, tosa.c, corgi.c and poodle.c

I don't dare adding ofpart here: this will be done once Zaurus pxa
platform is moved to devicetree.

>
> But really, I'd rather not add any more parser listings like this in
> drivers. Parser selection should be determined by the platform, not by
> the driver. See my last response to Rafal, who is trying to extend
> support for device-tree based listing of parsers:
>
> http://lists.infradead.org/pipermail/linux-mtd/2017-April/073729.html

Ok then but remember these are obsolete devices and as far as I know
these nand drivers are only used on Zaurus devices. No future use I
guess.

>
> He has some more work posted to the mailing list since then; search the
> archives.
>
> I'll take a look at the parser itself, and maybe we can merge that. But
> I'm not likely to merge this patch, in any form.
>
The little parser itself is universal for all Zaurus pxa variants.
As said above, please consider we can remove many lines of board code.

Thanks
Andrea

> Brian
>
>> +
>>  static int tmio_probe(struct platform_device *dev)
>>  {
>>       struct tmio_nand_data *data = dev_get_platdata(&dev->dev);
>> @@ -440,7 +442,7 @@ static int tmio_probe(struct platform_device *dev)
>>               goto err_irq;
>>
>>       /* Register the partitions */
>> -     retval = mtd_device_parse_register(mtd, NULL, NULL,
>> +     retval = mtd_device_parse_register(mtd, probes, NULL,
>>                                          data ? data->partition : NULL,
>>                                          data ? data->num_partitions : 0);
>>       if (!retval)
>> --
>> 2.7.4
>>
