Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UWZpJ-0007X0-EV
 for linux-mtd@lists.infradead.org; Sun, 28 Apr 2013 22:12:10 +0000
Received: by mail-wi0-f174.google.com with SMTP id m6so2182839wiv.7
 for <linux-mtd@lists.infradead.org>; Sun, 28 Apr 2013 15:12:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <OFCF117D0B.61A9CA12-ON48257B4F.002F2292-48257B4F.0030E459@zte.com.cn>
References: <OFCF117D0B.61A9CA12-ON48257B4F.002F2292-48257B4F.0030E459@zte.com.cn>
Date: Mon, 29 Apr 2013 00:12:05 +0200
Message-ID: <CAFLxGvxqwpc5fbyGpy9o4qzEfn0i3eocs36TrkX9=SfZ_oT-5w@mail.gmail.com>
Subject: Re: [PATCH] UBI: fix memory leak when use fastmap
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: wang.bo116@zte.com.cn
Content-Type: text/plain; charset=ISO-8859-1
Cc: liu.dong3@zte.com.cn, artem.bityutskiy@linux.intel.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, cui.yunfeng@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On Tue, Apr 16, 2013 at 10:53 AM,  <wang.bo116@zte.com.cn> wrote:
> Hello,
>         Sorry, there is still something wrong with the previous patch's
> format, try to submit it again. When use ubi fastmap, there is a memory
> leak which will make destroy_ai() fail to free the slab alloced in
> scan_fast(). The following patch fix this problem by use a temporary
> "ubi_attach_info" variable in scan_fast().

Thanks a lot for your patch!

Did you test it well?
We need to make sure that it does the right thing for the following cases:
1. fastmap disabled, attaching a non-fastmap volume
1. fastmap disabled, attaching a fastmap volume
3. fastmap enabled, attaching a non-fastmap volume
4. fastmap enablled, attaching a fastmap volume

--
Thanks,
//richard
