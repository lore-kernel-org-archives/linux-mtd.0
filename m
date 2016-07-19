Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPViA-0001BJ-PB
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 14:09:31 +0000
From: Kalle Valo <kvalo@codeaurora.org>
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd\@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the
 wireless-drivers-next tree
References: <20160719160831.79c0303f@canb.auug.org.au>
 <8760s2w369.fsf@kamboji.qca.qualcomm.com>
 <CACna6rxVFD1MpAEYP_Zd4W8CvgnxSQpa0wJs83jwDJ5v11gZ=Q@mail.gmail.com>
 <871t2qw1cz.fsf@kamboji.qca.qualcomm.com>
 <CACna6ry6QgrbUoHuJacmr1EhHZyrwqsXfr51gENvY-0zM9L+3Q@mail.gmail.com>
Date: Tue, 19 Jul 2016 17:08:59 +0300
In-Reply-To: <CACna6ry6QgrbUoHuJacmr1EhHZyrwqsXfr51gENvY-0zM9L+3Q@mail.gmail.com>
 (=?utf-8?Q?=22Rafa=C5=82_Mi=C5=82ecki=22's?= message of "Tue, 19 Jul 2016
 09:11:11 +0200")
Message-ID: <87h9blvhxg.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> writes:

> On 19 July 2016 at 09:09, Kalle Valo <kvalo@codeaurora.org> wrote:
>> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> writes:
>>
>>> On 19 July 2016 at 08:30, Kalle Valo <kvalo@codeaurora.org> wrote:
>>>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>>>>
>>>>> After merging the wireless-drivers-next tree, today's linux-next build
>>>>> (powerpc allyesconfig) failed like this:
>>>>>
>>>>> drivers/mtd/devices/bcm47xxsflash.c: In function 'bcm47xxsflash_bcma_=
probe':
>>>>> drivers/mtd/devices/bcm47xxsflash.c:299:17: error: implicit declarati=
on of function 'ioremap_cache' [-Werror=3Dimplicit-function-declaration]
>>>>>   b47s->window =3D ioremap_cache(res->start, resource_size(res));
>>>>>                  ^
>>>>> drivers/mtd/devices/bcm47xxsflash.c:299:15: warning: assignment makes=
 pointer from integer without a cast [-Wint-conversion]
>>>>>   b47s->window =3D ioremap_cache(res->start, resource_size(res));
>>>>>                ^
>>>>>
>>>>> Caused by commit
>>>>>
>>>>>   57d8f7dd2132 ("bcma: allow enabling serial flash support on non-MIP=
S SoCs")
>>>>>
>>>>> I have reverted that commit for today.
>>>>
>>>> Thanks, kbuild bot also notified about this.
>>>>
>>>> Rafa=C5=82, as the merge window is getting really close I would like to
>>>> revert this for now and we can reapply it once we the problem is fully
>>>> solved. And we can use my pending branch for build testing the patch
>>>> with kbuild bot. What do you think?
>>>
>>> The simplest fix sounds pretty much as simple as the revert.
>>
>> The problem is that I don't have much time, I need to send the pull
>> request to Dave within next few days. The fix might create other
>> problems so I'm not enthusiastic about iterating with this patch at the
>> moment. I think it can wait for 4.9.
>
> I sent a patch seconds ago, you may just take a look at it. If you
> still prefer to revert my commit, go ahead.

Ok, let's try your fix. We still have few days. I applied the patch[1]
to the pending branch this morning and if I don't see any errors I apply
it later tonight and hopefully it will be in tomorrow's linux-next
build. Thanks for the quick fix, very much appreciated.

[1] "mtd: add arch dependency for MTD_BCM47XXSFLASH symbol"
    https://patchwork.kernel.org/patch/9236053/

--=20
Kalle Valo
