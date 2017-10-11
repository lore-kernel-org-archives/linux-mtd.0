Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2OkF-0002D7-UK
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 21:40:53 +0000
Received: by mail-wm0-x231.google.com with SMTP id u138so8545569wmu.4
 for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2017 14:40:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1710111729390.6870@knanqh.ubzr>
References: <20171011032621.26979-1-nicolas.pitre@linaro.org>
 <20171011032621.26979-2-nicolas.pitre@linaro.org>
 <CAFLxGvynd+dtgPUbXAm7PZVw85=RoR+LfJEghAZLVmfAOVNjQA@mail.gmail.com>
 <nycvar.YSQ.7.76.1710111729390.6870@knanqh.ubzr>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 11 Oct 2017 23:40:29 +0200
Message-ID: <CAFLxGvzM8rW4T484Z3YEG6H8=PmdwrS_Xj+ZbxC+OQ707++2mw@mail.gmail.com>
Subject: Re: [PATCH 1/5] MTD: mtdram: properly handle the phys argument in the
 point method
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 11, 2017 at 11:32 PM, Nicolas Pitre
<nicolas.pitre@linaro.org> wrote:
> In fact the above should be: *retlen = addr - *virt;

Hmm, yes.

While we are here, how did you test that code?

> Let me know if I should repost.

Yes, please. But wait a few days, hopefully we get more reviews.

-- 
Thanks,
//richard
