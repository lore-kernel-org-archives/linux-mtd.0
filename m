Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7l1A-0000j3-V1
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 10:01:17 +0000
Received: by ghbf11 with SMTP id f11so1776779ghb.36
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2012 03:01:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1331628462.12037.56.camel@sauron.fi.intel.com>
References: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
 <1331559644.12037.33.camel@sauron.fi.intel.com>
 <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
 <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
 <1331619893.2443.10.camel@koala>
 <CAHMF36EpG5T2L3GDfgqPKA2XBqw2SipzX1OxXP0SDh==djgcsQ@mail.gmail.com>
 <1331628462.12037.56.camel@sauron.fi.intel.com>
Date: Wed, 14 Mar 2012 11:01:15 +0100
Message-ID: <CAHMF36G_iE3pEVh1WEVgm5H0p3wsePUxwu9-MCVB+v7vxFf4RQ@mail.gmail.com>
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

>> Which tests should I run? All of them or maybe just mtd_stresstest?
>>

I sent you the results yesterday, with no errors.

> I think the mtd_torture test would also be a good one to run for a day
> of 2.

Here is the first results of the mtd_tourturetest:

[84703.428000] mtd_torturetest: 00010240 erase cycles done, took
2054461 milliseconds (2054 seconds)
[86757.800000] mtd_torturetest: 00010752 erase cycles done, took
2054365 milliseconds (2054 seconds)
[88812.120000] mtd_torturetest: 00011264 erase cycles done, took
2054319 milliseconds (2054 seconds)
[90866.352000] mtd_torturetest: 00011776 erase cycles done, took
2054229 milliseconds (2054 seconds)
[92920.496000] mtd_torturetest: 00012288 erase cycles done, took
2054137 milliseconds (2054 seconds)
[94974.508000] mtd_torturetest: 00012800 erase cycles done, took
2054008 milliseconds (2054 seconds)

As far as I can see, there are no errors yet.
Should I continue with this, or should I try something else?

Thank you and Best Regards,
Matej
