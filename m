Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCJVJ-000526-HE
 for linux-mtd@lists.infradead.org; Wed, 30 Jul 2014 02:20:34 +0000
Message-ID: <53D85633.1020603@huawei.com>
Date: Wed, 30 Jul 2014 10:19:31 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
References: <53D7677A.6000905@huawei.com> <53D768B5.6090409@huawei.com>
 <CAFLxGvy6tYQnPMA2VKw8frfAQf7rN6jk72eDZ18n9sAp3Zq8XQ@mail.gmail.com>
In-Reply-To: <CAFLxGvy6tYQnPMA2VKw8frfAQf7rN6jk72eDZ18n9sAp3Zq8XQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> Isn't this racy?
> i.e. If a LEB change happens between ubi_is_mapped() and "pnum =
> vol->eba_tbl[req.lnum]".
> 

As I was writing this code, I used this ubi_is_mapped() to make sure
lnum is less than @vol->reserved_pebs and !@vol->upd_marker in order
to avoid kernel panic when we get pnum from eba_tbl.

Even we locked this ioctl, peb may also be changed before we read it
from MTD. That's why I didn't focus on this race. We can use some
condition check to make sure this vol is not mounted but user may use
this utility on rootfs.

Bill showed me a new method to get pnum without UBI driver. I will
try that first but this new method can't avoid peb changes before
we read it either. We should consider more on it.

Thanks!

Hu
