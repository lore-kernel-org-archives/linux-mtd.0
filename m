Received: from mail-yw0-x235.google.com ([2607:f8b0:4002:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bB4C8-0005Db-0i
 for linux-mtd@lists.infradead.org; Thu, 09 Jun 2016 17:56:40 +0000
Received: by mail-yw0-x235.google.com with SMTP id g20so44775187ywb.0
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2016 10:56:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160609072337.26f16f6a@bbrezillon>
References: <1465419681-6162-1-git-send-email-kdasu.kdev@gmail.com>
 <20160609072337.26f16f6a@bbrezillon>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 9 Jun 2016 13:55:39 -0400
Message-ID: <CAKekbeubr72rnoQytrS5m1L7hgFitQya4y6+70Cw5sLLUNNcUA@mail.gmail.com>
Subject: Re: [V2, 1/2] mtd: brcmnand: Add check for erased page bitflips
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

>> +
>> +     for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
>> +             bitflips = nand_check_erased_ecc_chunk(buf, chip->ecc.size,
>> +                                                    oob, sas, NULL, 0,
>> +                                                    chip->ecc.strength);
>> +             /* Too many bitflips */
>> +             if (bitflips < 0)
>> +                     break;
>
> Hm, should be
>                 ret = nand_check_erased_ecc_chunk(buf, chip->ecc.size,
>                                                   oob, sas, NULL, 0,
>                                                   chip->ecc.strength);
>                 if (ret < 0)
>                         return ret;
>
>                 bitflips = max(bitflips, ret);
>

Sounds reasonable to  return max bitflips from a sector within a page
instead of the last count. I will  make the change accordingly and
send a V3 patch.

Thanks
Kamal
