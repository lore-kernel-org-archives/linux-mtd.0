Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKn9T-0002kw-Tr
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 12:09:21 +0000
Message-ID: <54D8A356.8050509@nod.at>
Date: Mon, 09 Feb 2015 13:08:54 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Steve deRosier <derosier@gmail.com>,
 hujianyang <hujianyang@huawei.com>
Subject: Re: [RFC] UBIFS recovery
References: <54D33C36.9060805@huawei.com>
 <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>
 <54D3FE65.5030008@nod.at>
In-Reply-To: <54D3FE65.5030008@nod.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Sheng Yong <shengyong1@huawei.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steve,

Am 06.02.2015 um 00:36 schrieb Richard Weinberger:
>> I hear (and agree with) several valid arguments for a tool in
>> userspace. And I'd like to throw my support towards an in-driver
>> solution. Flash filesystems are different than on-disk filesystems, in
>> particular in their usecase: they're generally both critical and
>> exclusive to embedded systems. As such, the entire filesystem might be
>> on the corrupted UBIFS, so even if the filesystem is recoverable, if
>> we can't mount it and get at the userspace tool, then we're toast.
> 
> No, embedded is not per se an excuse for doing bad/stupid things.
> Embedded is *not* special.
> There are folks out there that want a "force" mount option for UBIFS
> to mount it in any case no matter in how bad shape it is.
> But this will make the situation much worse as you'll get silent data
> corruption/loss.
> It is as stupid as running a "fsck -y /dev/sdXY" at every boot on a
> regular disk filesystem.

just want to point out that my rather harsh reply was not meant as an attack against you.
I'm sorry for that, please accept my apology.

Thanks,
//richard
