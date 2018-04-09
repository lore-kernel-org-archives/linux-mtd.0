Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5USo-0002IQ-7z
 for linux-mtd@lists.infradead.org; Mon, 09 Apr 2018 10:56:10 +0000
Received: by mail-wm0-x229.google.com with SMTP id b127so18278145wmf.5
 for <linux-mtd@lists.infradead.org>; Mon, 09 Apr 2018 03:55:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <HE1PR0601MB2427C395930AEEA2E8B3F2CFF3BF0@HE1PR0601MB2427.eurprd06.prod.outlook.com>
References: <HE1PR0601MB2427C395930AEEA2E8B3F2CFF3BF0@HE1PR0601MB2427.eurprd06.prod.outlook.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 9 Apr 2018 12:55:40 +0200
Message-ID: <CAFLxGvxZKHBsZja-aEVGrR8ftqeGo9ptpj_zKFirvSKCMvSgmg@mail.gmail.com>
Subject: Re: Could someone tell me if the fastmap feature in ubi is stable for
 use in production?
To: "Wang, Qiong (Q.)" <qwang34@yfve.com.cn>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

On Mon, Apr 9, 2018 at 12:25 PM, Wang, Qiong (Q.) <qwang34@yfve.com.cn> wro=
te:
> Hi experts,
>
> I have found the below link in the linux-mtd website explaining fastmap f=
eature in ubi.
> http://linux-mtd.infradead.org/doc/ubi.html#L_fastmap
>
> Our project uses large nand flash and I found that fastmap can reduce the=
 ubi attach process to the time we want. Our concern is, since it is an exp=
erimental, is it stable to use in our project? Are there any reported issue=
 of this feature?Our biggest worry is that can it possibly brick our system=
 during the boot up process.

Well, it is a non-trvial aggressive optimization.
Lately I planned to mark it finally as stable but then this happened popped=
 up.

[0] http://lists.infradead.org/pipermail/linux-mtd/2018-March/079610.html

On the other hand, if only very few people are using it, we won't find
remaining subtle bugs.

--=20
Thanks,
//richard
