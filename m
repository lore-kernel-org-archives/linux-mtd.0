Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7MDM-00054L-4q
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 07:32:12 +0000
Received: by yhjj52 with SMTP id j52so247062yhj.36
 for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2012 00:32:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1331619893.2443.10.camel@koala>
References: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
 <1331559644.12037.33.camel@sauron.fi.intel.com>
 <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
 <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
 <1331619893.2443.10.camel@koala>
Date: Tue, 13 Mar 2012 08:32:10 +0100
Message-ID: <CAHMF36EpG5T2L3GDfgqPKA2XBqw2SipzX1OxXP0SDh==djgcsQ@mail.gmail.com>
Subject: Re: UBIFS crash (was Re: Problems with mtd_oobtest)
From: Matej Kupljen <matej.kupljen@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Artem,

>> What could be the cause of such many errors in FS?
>> I am really running out of ideas, how to solve this, so any hint would
>> be appreciated.
>
> This looks like non-UBI/UBIFS issue but more like issue with your flash
> driver or HW. Start stress-testing the driver. Try MTD running mtd tests
> over night.

O.K.
I already tried that, but only the mtd_oobtest failed.

Which tests should I run? All of them or maybe just mtd_stresstest?

Do I need to format the NAND?
I'll boot it with rootfs on SD card and try the stresstest.

Thanks and Best Regards,
Matej
