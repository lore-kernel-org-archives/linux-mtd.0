Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dA69p-0007nZ-2R
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 02:54:50 +0000
Received: by mail-wm0-x229.google.com with SMTP id d127so60143570wmf.0
 for <linux-mtd@lists.infradead.org>; Sun, 14 May 2017 19:54:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d39d149e-15be-1a7b-e3d5-c9d16cfaaf30@nod.at>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <CAFLxGvyTvqY69AeoSrKWNjea-8u5YxKEBOznpUj9g==_UDnLew@mail.gmail.com>
 <CAKKQwLTGFY+bfFCoPNtvpFK-w-3SnNc_G2xDd_xip3iiwVDM4A@mail.gmail.com>
 <20170512102407.217b805a@bbrezillon>
 <CAKKQwLTVpsu8j50BkqkgBwk9A3rPfrYDUTYDXbAn_OiA-tUd7g@mail.gmail.com>
 <20170512104554.5670bb4d@bbrezillon>
 <CAKKQwLQueea6G4B-cng9QdpjtRWyBWHw1Mq9ai3DVp31xswANg@mail.gmail.com>
 <20170512110230.56e6250d@bbrezillon>
 <CAKKQwLT2n==ta=qjZtxZPyqyjBRBLtBKr_uWBjtjy-yjMPVM+A@mail.gmail.com>
 <982c0331-216c-3096-9349-d18e2247ddac@nod.at>
 <CAKKQwLSkv_bVPxYqjUKqasDzZ6PiZdhiksipDbHmgnmVWPYN7Q@mail.gmail.com>
 <20170512113414.213f515b@bbrezillon>
 <CAKKQwLSwL76mBVbr2-w6mh4RS1bzRGuLCx2TwuQ=fnNjdxsZhg@mail.gmail.com>
 <20170512121908.135da352@bbrezillon>
 <CAKKQwLRgBuwifywcsa=zAaUi48YSh7UWkYKf9Gho=p5VhNPHeg@mail.gmail.com>
 <d39d149e-15be-1a7b-e3d5-c9d16cfaaf30@nod.at>
From: Mario Rugiero <mrugiero@gmail.com>
Date: Sun, 14 May 2017 23:54:26 -0300
Message-ID: <CAKKQwLRDOwBzAuaFOkd5yVRXHAkChTTyFTnczMTmcCU_dN_iZw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
To: Richard Weinberger <richard@nod.at>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for the noise, but I'm resending since my phone is fixated on
sending HTML mails, so it was rejected from the list:
After some thought, I believe the proper solution is the one proposed
by Boris: write a little program which classifies the false positives
for bad blocks, and erase those blocks forcibly.
What I'm currently wondering is if the incompatibilities come with
false negatives too. In such a case, we should be able to provide the
MTD driver with the information we just gathered, or is it viable to
just program the BBT we just built?

Regards,
Mario.

PD (not in the original mail): would mtd-tools the right place to do
this, or rather sunxi-tools? I think converting from vendor-specific
layouts to MTD could be a more common problem, so I thought of trying
and making it generic enough to support several backends.

2017-05-13 6:17 GMT-03:00 Richard Weinberger <richard@nod.at>:
> Mario,
>
> Am 12.05.2017 um 12:23 schrieb Mario Rugiero:
>>> Actually, most of the development is done already, but we need to
>>> intensively test the implementation and cleanup the code.
>> If you can describe the tests to me, I think I can have them running
>> in at least three devices during next week.
>> I can help with the cleanup, too.
>
> Well, the critical and most important task is understanding the existing
> issues, see slides, and find a bulletproof solution that scales.
>
> If you have questions, don't hesitate to ask. You can also find
> me and Boris on #mtd.
>
> Thanks,
> //richard
