Received: from mail-oa0-f49.google.com ([209.85.219.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGmF8-00050a-1R
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 07:41:14 +0000
Received: by oagl10 with SMTP id l10so309402oag.36
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2012 00:41:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1348645171.24309.21.camel@sauron.fi.intel.com>
References: <1347481275-995-1-git-send-email-zajec5@gmail.com>
 <1348645171.24309.21.camel@sauron.fi.intel.com>
Date: Wed, 26 Sep 2012 09:41:09 +0200
Message-ID: <CACna6ryBwu3BFH=4PrmqnvL1qQdk5xcVCKb2=7UrCSpsvmpK5Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] mtd: prepare place for BCMA NAND flash driver(s)
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/26 Artem Bityutskiy <dedekind1@gmail.com>:
> On Wed, 2012-09-12 at 22:21 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> +config MTD_NAND_BCM47XXNFLASH
>> +     tristate "Support for NAND flash on BCMA bus"
>> +     depends on BCMA_NFLASH && BROKEN
>> +     help
>> +       BCMA bus can have various flash memories attached, they are
>> +       registered by bcma as platform devices. This enables driver for
>> +       NAND flash memories.
>
> Could we please merge only non-broken stuff upstream. I understand your
> intentions to merge something non-working first with a promise to make
> it working later, but I do not think this is an acceptable approach.
>
> Why exactly you mark this one as broken? If it is R/O so far, and
> reading works, and you tested it (how?), we can merge it I guess, just
> make it clear that it is R/O in Kconfig help text.

Yes, BROKEN can be dropped from this. I'll resend correct patchset
after checking it with verify/aiaiai (i'm almost done! :) )

--=20
Rafa=C5=82
