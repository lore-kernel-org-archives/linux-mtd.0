Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTqbf-0004tM-Vb
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2017 13:48:57 +0000
Received: by mail-yw0-x243.google.com with SMTP id 17so1029189ywk.2
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2017 05:48:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e5bb2245-a0d0-5b66-2c75-9af26c6ea846@phrozen.org>
References: <1484741452-27141-1-git-send-email-sebtx452@gmail.com>
 <e5bb2245-a0d0-5b66-2c75-9af26c6ea846@phrozen.org>
From: Seb <sebtx452@gmail.com>
Date: Wed, 18 Jan 2017 14:48:33 +0100
Message-ID: <CA+hF=GeD0dhBUkR+wR_35pSXgSnU0kW6EfYWa9h2QrGOTReMnA@mail.gmail.com>
Subject: Re: [PATCH] mtd: maps: lantiq-flash: Check if the EBU endianness swap
 is enabled
To: John Crispin <john@phrozen.org>
Cc: linux-mtd@lists.infradead.org, linux-mips@linux-mips.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi John,


>>
>>       ltq_mtd->map->map_priv_1 = LTQ_NOR_PROBING;
>
> this line should be dropped

Yes, I noticed this mistake. I fixed it but forgotten to add thix fix
to my commit -_-

>> +     /* We swap the addresses only if the EBU endianness swap is disabled */
>> +     if (ltq_ebu_r32(LTQ_EBU_BUSCON0) & BIT(30))
>
> add a define for BIT(30) please and we should really check if this a
> v1.2 or newer. if my memory is correct this was a silicon bug inside
> v1.0 and v1.1

In my kernel (OpenWrt) boot log I have :

[    0.000000] Linux version 4.4.14 (qa@serveurQA) (gcc version 5.3.0
(OpenWrt GCC 5.3.0 50020) ) #150 SMP Tue Jan 17 09:18:24 UTC 2017
[    0.000000] SoC: xRX200 rev 1.2
[    0.000000] bootconsole [early0] enabled
[    0.000000] CPU0 revision is: 00019556 (MIPS 34Kc)

It would be better to ensure that the SoC version is >= 1.2 (as this
bug was fixed in this version).

You can get more informations in my OpenWrt pull request :

https://github.com/openwrt/openwrt/pull/321


Regards,

Sebastien.
