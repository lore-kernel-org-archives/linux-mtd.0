Received: from mail-io0-x22c.google.com ([2607:f8b0:4001:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0D33-0002S9-TK
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 20:15:00 +0000
Received: by mail-io0-x22c.google.com with SMTP id o22so44603689iod.3
 for <linux-mtd@lists.infradead.org>; Mon, 17 Apr 2017 13:14:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyYKeNTgRdeBn5qsthw0LSMpxgjjM0SssX4cwCOqV11Yw@mail.gmail.com>
References: <CAAN9NvfwjBaHWBo=5P=s9+ivPy_r-peSEdHK7UwJaOz4-8R9Pw@mail.gmail.com>
 <CAFLxGvyYKeNTgRdeBn5qsthw0LSMpxgjjM0SssX4cwCOqV11Yw@mail.gmail.com>
From: Raphael Pereira <raphaelpereira@gmail.com>
Date: Mon, 17 Apr 2017 17:14:34 -0300
Message-ID: <CAAN9Nvf_3TDV-HcpmmUoYUPw7ECDzRcfLQshDiutQg7QYAkTcg@mail.gmail.com>
Subject: Re: UBIFS replay journal failure on power cuts
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you. I updated to 4.10.10 and the problem is solved. I had a
problem with GPMI that kept me on below 3.18 kernels, but that seems
to be corrected too after some point beyond 4.4


2017-04-17 17:07 GMT-03:00 Richard Weinberger <richard.weinberger@gmail.com>:
> On Mon, Apr 17, 2017 at 1:29 AM, Raphael Pereira
> <raphaelpereira@gmail.com> wrote:
>> Hello,
>>
>> I have been using UBIFS on a device and have been getting some
>> unrecoverable errors on journal replay after some power cuts.
>>
>> I have not stablished the specific way to reproduce the problem, but
>> it is happening with some repeatability.
>>
>> The error seems quite like both threads:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2014-July/054620.html
>> http://lists.infradead.org/pipermail/linux-mtd/2016-June/068339.html
>>
>> And before you ask, I do indeed use fastmap.
>
> Did you backport all fastmap related fixes/improvements?
> The kernel you are using is very old.
>
> --
> Thanks,
> //richard



-- 
Raphael Derosso Pereira
