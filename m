Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaUaO-0006g1-8Z
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 20:06:17 +0000
Received: by lagj9 with SMTP id j9so55569704lag.2
 for <linux-mtd@lists.infradead.org>; Fri, 11 Sep 2015 13:05:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55F270EE.9060801@huawei.com>
References: <1441962597-13543-1-git-send-email-shengyong1@huawei.com>
 <1441962597-13543-2-git-send-email-shengyong1@huawei.com>
 <55F2601B.60203@cn.fujitsu.com> <55F270EE.9060801@huawei.com>
Date: Fri, 11 Sep 2015 22:05:52 +0200
Message-ID: <CAHpGcMJ3GYJNzKh0Z3VXd3K8c_J2bDpTmrK4FfE6e1H-dPY_oA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] UBIFS: ACL: introduce init/set/get functions
 for ACL
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
To: Sheng Yong <shengyong1@huawei.com>
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2015-09-11 8:13 GMT+02:00 Sheng Yong <shengyong1@huawei.com>:
> It seems xattr handler will be removed because of dead code of security xattr.

The security xattr handler right now is dead code. If you can convert
ubifs to use the xattr handler infrastructure (super_block.s_xattr,
etc.), that would be great; the security xattr handler would then
start being useful. You could then implement POSIX ACLs as tmpfs does
(mm/shmem.c).

Andreas
