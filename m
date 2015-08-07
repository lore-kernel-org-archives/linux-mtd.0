Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNhAT-0008KL-KY
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 12:54:38 +0000
Received: by wijp15 with SMTP id p15so59134614wij.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2015 05:54:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxjKVLRQ1Jrjw-hTLq8k1jMTeWVOYwdgHzg=_dQfFsnRg@mail.gmail.com>
References: <CAEo2pzuPdN56QQbvoao_oo9oppr1CNmBMhq7d0BSGQXraBZYOA@mail.gmail.com>
 <CAFLxGvxjKVLRQ1Jrjw-hTLq8k1jMTeWVOYwdgHzg=_dQfFsnRg@mail.gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 7 Aug 2015 14:53:36 +0200
Message-ID: <CAOMqctSmF8S9=F7JJKciF0wksLid2CkxXt_=3_3Qct=uM_nRwA@mail.gmail.com>
Subject: Re: ubifs: nand flash wear profiling for userspace application file
 i/o
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: =?UTF-8?B?0JjQu9GM0Y/RgSDQk9Cw0YHQsNC90L7Qsg==?= <torso.nafi@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7 August 2015 at 14:30, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Fri, Aug 7, 2015 at 1:47 PM, =D0=98=D0=BB=D1=8C=D1=8F=D1=81 =D0=93=D0=
=B0=D1=81=D0=B0=D0=BD=D0=BE=D0=B2 <torso.nafi@gmail.com> wrote:
>> Hello.
>>
>> We are developing a GNU/Linux-based appliance, and our customers are
>> concerned that the defining application, which runs on it, wears out
>> its flash storage too quickly under certain circumstances. The h/w
>> supplier guarantees at least 10 000 rewrite cycles for its nand flash
>> blocks before wear out.
>
> 10000 is not much, is this MLC?
>
>> Is there a suitable method to count (or accurately estimate) the
>> distribution of rewrite cycles for ubifs flash blocks during a certain
>> period of application work cycle, e. g. for three days? The power is
>> not guaranteed to be 100% time on, without a single outage, so it
>> would be preferred if persistent data is used, like ubifs journal or
>> ubi wear-leveling peb contents, rather than volatile kernelspace
>> counters and such.
>
> ubinfo prints the maximum erase counter value, does this help?
> This info is also available via /sys/class/ubi/ubi0/max_ec.
>
> If you want the distribution you have to write a small script which
> reads the EC header of all blocks.
> But as UBI does wear leveling for you, the distribution should not
> matter. Please keep in mind that you need to define a sane
> WL threshold.
>

Also be aware that with MLC power outage can destroy already written
block which is in the same physical area as the currently programmed
block which ubifs currently does not handle AFAIK.

Thanks

Michal
