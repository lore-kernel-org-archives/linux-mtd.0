Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7nkI-0004uE-Uk
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 12:56:03 +0000
Received: by eaak13 with SMTP id k13so935011eaa.36
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2012 05:56:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1331727617.3730.5.camel@sauron.fi.intel.com>
References: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
 <1331559644.12037.33.camel@sauron.fi.intel.com>
 <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
 <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
 <1331619893.2443.10.camel@koala>
 <CAHMF36EpG5T2L3GDfgqPKA2XBqw2SipzX1OxXP0SDh==djgcsQ@mail.gmail.com>
 <1331628462.12037.56.camel@sauron.fi.intel.com>
 <CAHMF36G_iE3pEVh1WEVgm5H0p3wsePUxwu9-MCVB+v7vxFf4RQ@mail.gmail.com>
 <1331727617.3730.5.camel@sauron.fi.intel.com>
Date: Wed, 14 Mar 2012 13:55:59 +0100
Message-ID: <CAHMF36H_+ohHph_mn+iaVnH9Z_WQR0bkQT8Fv8s8cTHE5vV+fg@mail.gmail.com>
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

Artem,

>> [94974.508000] mtd_torturetest: 00012800 erase cycles done, took
>> 2054008 milliseconds (2054 seconds)
>
> Well, it is still good to run it for few days.

I'll leave it running.

> But then I would try to do UBIFS testing in some limited environment to
> exclude a possibility of some process writing directly to /dev/mtd and
> corrupting data. E.g., testing it in a minimal shell.

What do you mean by that?
Still boot it from MMC, but then mount the UBIFS on some different
point and start testing? Which tests to do?

Thanks,
Matej
