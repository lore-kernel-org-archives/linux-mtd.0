Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d97ty-000735-Df
 for linux-mtd@lists.infradead.org; Fri, 12 May 2017 10:34:28 +0000
Received: by mail-wr0-x235.google.com with SMTP id l50so41341738wrc.3
 for <linux-mtd@lists.infradead.org>; Fri, 12 May 2017 03:34:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKKQwLRgBuwifywcsa=zAaUi48YSh7UWkYKf9Gho=p5VhNPHeg@mail.gmail.com>
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
From: Mario Rugiero <mrugiero@gmail.com>
Date: Fri, 12 May 2017 07:34:04 -0300
Message-ID: <CAKKQwLSWBfKWvOh0O9ojBhm=5TayRxEyZCUAAux77Nu+6JVBXA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
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

2017-05-12 7:23 GMT-03:00 Mario Rugiero <mrugiero@gmail.com>:
> 2017-05-12 7:19 GMT-03:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>> On Fri, 12 May 2017 07:06:45 -0300
>> Mario Rugiero <mrugiero@gmail.com> wrote:
>>
>>> 2017-05-12 6:34 GMT-03:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>>> > On Fri, 12 May 2017 06:26:14 -0300
>>> > Mario Rugiero <mrugiero@gmail.com> wrote:
>>> >
>>> >> 2017-05-12 6:19 GMT-03:00 Richard Weinberger <richard@nod.at>:
>>> >> > Am 12.05.2017 um 11:15 schrieb Mario Rugiero:
>>> >> >> I'll read it carefully later. Is there any rough time estimate for it
>>> >> >> to hit mainline?
>>> >> >> I'm not expecting a date, but rather something in the lines of
>>> >> >> "several weeks, several months, several years".
>>> >> >> I think we can do with several months, and we'd be happy to start
>>> >> >> local experiments with that timeframe in mind.
>>> >> >> Several years might be more than the devices will live, though.
>>> >> >
>>> >> > Since there is currently no funding it might take much longer.
>>> >> GSoC sounds like a viable workaround.
>>> >> It'd hahve to wait for next year, though.
>>> >> I think I'm elligible, so if I still have access to these boards and
>>> >> Boris can mentor me, we could get funding to speed up the development.
>>> >> I'd be happy to donate it to have another developer, as I'm already
>>> >> kinda being paid for this.
>>> >> What do you think of that?
>>> >
>>> > Yep, that's a possibility.
>>> Great. Could you act as a mentor without GSoC for now?
>>
>> Sure.
>>
>>> I think I might be able to help after finishing with the slides, they
>>> seem clear enough, with proper guidance, and that'd help in my current
>>> work.
>>> I think I've read some slides from a previous talk by you, before the
>>> way to go was as clearly defined.
>>
>> Actually, most of the development is done already, but we need to
>> intensively test the implementation and cleanup the code.
> If you can describe the tests to me, I think I can have them running
> in at least three devices during next week.
> I can help with the cleanup, too.
>>
>> I also started to modify mtd-utils [1] to support the new format, but
>> didn't have time to finish.
>>
>> [1]https://github.com/bbrezillon/mtd-utils/tree/ubi/mlc
> I'll try to help with that.
Back to the original subject, scrubbing from Linux on demand.
Is it a total no-go, or if I add the debugfs entry to make it opt-in
on runtime too it might get accepted?
Is it viable to add it as a new operation, so it can be more explicit
about the risks?
Where would be the proper place to put the debugfs entry?
nand_base.c doesn't seem to deal with debugfs, and exporting the
variable seems too risky IMO.
