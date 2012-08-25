Received: from mail-qa0-f49.google.com ([209.85.216.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5AU2-0006AA-Ak
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 07:08:38 +0000
Received: by qafk1 with SMTP id k1so918650qaf.15
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 00:08:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345824387.2848.336.camel@sauron.fi.intel.com>
References: <1345355849-8992-1-git-send-email-shijie8@gmail.com>
 <1345824387.2848.336.camel@sauron.fi.intel.com>
Date: Sat, 25 Aug 2012 03:08:35 -0400
Message-ID: <CAMiH66FQ-ZvT+D-9dvSHYPD69zwd7XMLr0=CAQAyiCX5zKgAUA@mail.gmail.com>
Subject: Re: [PATCH] mtd: cmdlinepart: fix the wrong check condition
From: Huang Shijie <shijie8@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 24, 2012 at 12:06 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:

> So you may also just add
>
> if (!mtd_id)
>         return 0
>
> at the beginning?

yes. Your code is better then mine.


Huang Shijie
