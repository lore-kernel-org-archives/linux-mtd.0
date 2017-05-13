Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d9TBy-0005I4-OL
 for linux-mtd@lists.infradead.org; Sat, 13 May 2017 09:18:28 +0000
Subject: Re: [PATCH] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
To: Mario Rugiero <mrugiero@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard.weinberger@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <d39d149e-15be-1a7b-e3d5-c9d16cfaaf30@nod.at>
Date: Sat, 13 May 2017 11:17:59 +0200
MIME-Version: 1.0
In-Reply-To: <CAKKQwLRgBuwifywcsa=zAaUi48YSh7UWkYKf9Gho=p5VhNPHeg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mario,

Am 12.05.2017 um 12:23 schrieb Mario Rugiero:
>> Actually, most of the development is done already, but we need to
>> intensively test the implementation and cleanup the code.
> If you can describe the tests to me, I think I can have them running
> in at least three devices during next week.
> I can help with the cleanup, too.

Well, the critical and most important task is understanding the existing
issues, see slides, and find a bulletproof solution that scales.

If you have questions, don't hesitate to ask. You can also find
me and Boris on #mtd.

Thanks,
//richard
