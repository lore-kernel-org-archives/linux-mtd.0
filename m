Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S8AAn-0007ng-Ef
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2012 12:52:54 +0000
Received: by eaak13 with SMTP id k13so1684713eaa.36
 for <linux-mtd@lists.infradead.org>; Thu, 15 Mar 2012 05:52:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1331731119.3730.17.camel@sauron.fi.intel.com>
References: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
 <1331559644.12037.33.camel@sauron.fi.intel.com>
 <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
 <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
 <1331619893.2443.10.camel@koala>
 <CAHMF36EpG5T2L3GDfgqPKA2XBqw2SipzX1OxXP0SDh==djgcsQ@mail.gmail.com>
 <1331628462.12037.56.camel@sauron.fi.intel.com>
 <CAHMF36G_iE3pEVh1WEVgm5H0p3wsePUxwu9-MCVB+v7vxFf4RQ@mail.gmail.com>
 <1331727617.3730.5.camel@sauron.fi.intel.com>
 <CAHMF36H_+ohHph_mn+iaVnH9Z_WQR0bkQT8Fv8s8cTHE5vV+fg@mail.gmail.com>
 <1331731119.3730.17.camel@sauron.fi.intel.com>
Date: Thu, 15 Mar 2012 13:52:46 +0100
Message-ID: <CAHMF36G7nXXGc_uQySzPFhtALb=9Vp2Lwn=dop+EauSL-Rf=Bg@mail.gmail.com>
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

> I guess I meant to somehow make sure that UBIFS exclusively owns the mtd
> device and no one or nothing accesses it.

Thanks for all the suggestions, I guess I'll start with them now, because
my device has been tortured for 3 days with result:

[179113.412000] mtd_torturetest: 00033792 erase cycles done, took
2051108 milliseconds (2051 seconds)
[181164.576000] mtd_torturetest: 00034304 erase cycles done, took
2051160 milliseconds (2051 seconds)
[183215.724000] mtd_torturetest: 00034816 erase cycles done, took
2051143 milliseconds (2051 seconds)
[185266.832000] mtd_torturetest: 00035328 erase cycles done, took
2051102 milliseconds (2051 seconds)
[187317.844000] mtd_torturetest: 00035840 erase cycles done, took
2051006 milliseconds (2051 seconds)
[189368.464000] mtd_torturetest: 00036352 erase cycles done, took
2050615 milliseconds (2050 seconds)
[191419.440000] mtd_torturetest: 00036864 erase cycles done, took
2050974 milliseconds (2050 seconds)

I'll let you know if I find what caused all the problems.

Thank you again,
Matej
