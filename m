Received: from mail-qc0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SAgx2-0005nd-U5
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2012 12:17:09 +0000
Received: by qcsu28 with SMTP id u28so1412265qcs.36
 for <linux-mtd@lists.infradead.org>; Thu, 22 Mar 2012 05:17:06 -0700 (PDT)
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
Date: Thu, 22 Mar 2012 13:17:06 +0100
Message-ID: <CAHMF36Fyb+X_tZjgs1Siu2p1Zbrmu-7TBL73Zf3Rjx3SiyeBjA@mail.gmail.com>
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

> Well, you can try the ones you used, or the fsstress test from the LTP
> project, or I'd recommend to try the integck test from mtd-utils.

I finally found some time again to do the tests and cross compiled latest
mtd-utils form git. I booted form SD card, mounted the UBIFS and tried
to run integck, as you suggested. But here is what I get:

# ./integck /mnt/card/
integck: error!: cannot find file-system info
integck: error!: condition '0' failed in get_tested_fs_info() at integck.c:2942
integck: error 0 (Success)

Any known error?

Thanks and Best Regards,
Matej
