Received: from mail-vn0-x22d.google.com ([2607:f8b0:400c:c0f::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2a1L-0001aA-7W
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 07:01:55 +0000
Received: by vnbg7 with SMTP id g7so6488216vnb.10
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 00:01:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <557791DF.9040501@huawei.com>
References: <2b88f8ae.15caa.14ddab0368e.Coremail.cyl665236@126.com>
 <557791DF.9040501@huawei.com>
Date: Wed, 10 Jun 2015 09:01:31 +0200
Message-ID: <CAFLxGvz4QX=C34eWYF-dV+7TzkKLe0ckETyCNiwPLky1UKQqOg@mail.gmail.com>
Subject: Re: ubifs problem
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Sheng Yong <shengyong1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Cc: mtd mailing list <linux-mtd@lists.infradead.org>, cyl <cyl665236@126.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 10, 2015 at 3:24 AM, Sheng Yong <shengyong1@huawei.com> wrote:
> It seems you got an ECC error when reading master node. For ECC error, there is
> no easy way to recover it. Maybe you could dump the bad LEB to see what is wrong
> with `ubidump', and fix it by hand.

The interesting question is, why did the PEB turn bad?
UBI assumes that a PEB does not become unreadable all of a sudden.

-- 
Thanks,
//richard
