Received: from mail-vb0-x22b.google.com ([2607:f8b0:400c:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VaZ94-00070i-6B
 for linux-mtd@lists.infradead.org; Sun, 27 Oct 2013 22:49:19 +0000
Received: by mail-vb0-f43.google.com with SMTP id g10so4132879vbg.16
 for <linux-mtd@lists.infradead.org>; Sun, 27 Oct 2013 15:48:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201310271730.12065.marex@denx.de>
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <201310271730.12065.marex@denx.de>
Date: Sun, 27 Oct 2013 15:48:48 -0700
Message-ID: <CAN8TOE-LWj7+6NRZbKJDz=fvVgMVtRvA5UqJ5AvLAwG+jRpgpw@mail.gmail.com>
Subject: Re: [PATCH 1/5] mtd: m25p80: fix allocation size
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Sourav Poddar <sourav.poddar@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 stable@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 27, 2013 at 9:30 AM, Marek Vasut <marex@denx.de> wrote:
> Hi Brian,
>
> [...]
>
>> @@ -1137,14 +1135,10 @@ static int m25p_probe(struct spi_device *spi)
>>  static int m25p_remove(struct spi_device *spi)
>>  {
>>       struct m25p     *flash = spi_get_drvdata(spi);
>> -     int             status;
>>
>>       /* Clean up MTD stuff. */
>> -     status = mtd_device_unregister(&flash->mtd);
>> -     if (status == 0) {
>> -             kfree(flash->command);
>> -             kfree(flash);
>> -     }
>> +     mtd_device_unregister(&flash->mtd);
>> +
>>       return 0;
>>  }
>
> I wonder if we shouldn't return "status" in here in case mtd_device_unregister()
> failed.

Sure, I thought of that earlier actually. I may send a trivial
follow-up patch for this.

Thanks,
Brian
