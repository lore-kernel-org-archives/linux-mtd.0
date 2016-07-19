Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPPBl-0008HZ-Fg
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 07:11:34 +0000
Received: by mail-oi0-x241.google.com with SMTP id l9so973236oih.0
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 00:11:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871t2qw1cz.fsf@kamboji.qca.qualcomm.com>
References: <20160719160831.79c0303f@canb.auug.org.au>
 <8760s2w369.fsf@kamboji.qca.qualcomm.com>
 <CACna6rxVFD1MpAEYP_Zd4W8CvgnxSQpa0wJs83jwDJ5v11gZ=Q@mail.gmail.com>
 <871t2qw1cz.fsf@kamboji.qca.qualcomm.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Tue, 19 Jul 2016 09:11:11 +0200
Message-ID: <CACna6ry6QgrbUoHuJacmr1EhHZyrwqsXfr51gENvY-0zM9L+3Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the wireless-drivers-next
 tree
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On 19 July 2016 at 09:09, Kalle Valo <kvalo@codeaurora.org> wrote:
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> writes:
>
>> On 19 July 2016 at 08:30, Kalle Valo <kvalo@codeaurora.org> wrote:
>>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>>>
>>>> After merging the wireless-drivers-next tree, today's linux-next build
>>>> (powerpc allyesconfig) failed like this:
>>>>
>>>> drivers/mtd/devices/bcm47xxsflash.c: In function 'bcm47xxsflash_bcma_p=
robe':
>>>> drivers/mtd/devices/bcm47xxsflash.c:299:17: error: implicit declaratio=
n of function 'ioremap_cache' [-Werror=3Dimplicit-function-declaration]
>>>>   b47s->window =3D ioremap_cache(res->start, resource_size(res));
>>>>                  ^
>>>> drivers/mtd/devices/bcm47xxsflash.c:299:15: warning: assignment makes =
pointer from integer without a cast [-Wint-conversion]
>>>>   b47s->window =3D ioremap_cache(res->start, resource_size(res));
>>>>                ^
>>>>
>>>> Caused by commit
>>>>
>>>>   57d8f7dd2132 ("bcma: allow enabling serial flash support on non-MIPS=
 SoCs")
>>>>
>>>> I have reverted that commit for today.
>>>
>>> Thanks, kbuild bot also notified about this.
>>>
>>> Rafa=C5=82, as the merge window is getting really close I would like to
>>> revert this for now and we can reapply it once we the problem is fully
>>> solved. And we can use my pending branch for build testing the patch
>>> with kbuild bot. What do you think?
>>
>> The simplest fix sounds pretty much as simple as the revert.
>
> The problem is that I don't have much time, I need to send the pull
> request to Dave within next few days. The fix might create other
> problems so I'm not enthusiastic about iterating with this patch at the
> moment. I think it can wait for 4.9.

I sent a patch seconds ago, you may just take a look at it. If you
still prefer to revert my commit, go ahead.

--=20
Rafa=C5=82
