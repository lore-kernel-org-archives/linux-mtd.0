Received: from mail-pl0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6HMl-0003BJ-GO
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2018 15:08:57 +0000
Received: by mail-pl0-x22f.google.com with SMTP id e22-v6so1610534plj.12
 for <linux-mtd@lists.infradead.org>; Wed, 11 Apr 2018 08:08:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxZKHBsZja-aEVGrR8ftqeGo9ptpj_zKFirvSKCMvSgmg@mail.gmail.com>
References: <HE1PR0601MB2427C395930AEEA2E8B3F2CFF3BF0@HE1PR0601MB2427.eurprd06.prod.outlook.com>
 <CAFLxGvxZKHBsZja-aEVGrR8ftqeGo9ptpj_zKFirvSKCMvSgmg@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 11 Apr 2018 12:08:43 -0300
Message-ID: <CAAEAJfD8OhiekCgNjYjEVa65Xe8CXK2UM4C74xt4JVz-K7xzDQ@mail.gmail.com>
Subject: Re: Could someone tell me if the fastmap feature in ubi is stable for
 use in production?
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "Wang, Qiong (Q.)" <qwang34@yfve.com.cn>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Wang, Qiong (Q.),


On 9 April 2018 at 07:55, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> Wang, Qiong (Q.),
>
> On Mon, Apr 9, 2018 at 12:25 PM, Wang, Qiong (Q.) <qwang34@yfve.com.cn> w=
rote:
>> Hi experts,
>>
>> I have found the below link in the linux-mtd website explaining fastmap =
feature in ubi.
>> http://linux-mtd.infradead.org/doc/ubi.html#L_fastmap
>>
>> Our project uses large nand flash and I found that fastmap can reduce th=
e ubi attach process to the time we want. Our concern is, since it is an ex=
perimental, is it stable to use in our project? Are there any reported issu=
e of this feature?Our biggest worry is that can it possibly brick our syste=
m during the boot up process.

For what it's worth, I've used UBI fastmap in production, and so far
we didn't have
issues.

Note that we prepared a lot of tests, based on our particular use
case. If I remember
correctly, we hit one bug and Richard was kind enough to fix it in a few ho=
urs.

So my advise is: use it, but by all means test it. As anything else.

Hope it helps,
Eze
