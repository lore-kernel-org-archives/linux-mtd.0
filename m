Received: from mail-ve0-x234.google.com ([2607:f8b0:400c:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViBDo-00077x-8Q
 for linux-mtd@lists.infradead.org; Sun, 17 Nov 2013 22:53:40 +0000
Received: by mail-ve0-f180.google.com with SMTP id jz11so910870veb.25
 for <linux-mtd@lists.infradead.org>; Sun, 17 Nov 2013 14:53:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1384728305.14335.4.camel@joe-AO722>
References: <1384719513-27386-1-git-send-email-nunes.erico@gmail.com>
 <1384724403.2727.22.camel@joe-AO722>
 <CAK4VdL2nKEE+xb=HtMGNsMGNR_ivUn_WnLi7X-rrXT0fpGbSTw@mail.gmail.com>
 <1384728305.14335.4.camel@joe-AO722>
Date: Sun, 17 Nov 2013 23:53:16 +0100
Message-ID: <CAFLxGvx=uOr0Oh-FiB-NG8ytZE6a3c3POVm6a_czrc_7LoL0xg@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix sparse errors: directive in argument list
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Joe Perches <joe@perches.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dwmw2 <dwmw2@infradead.org>, linux-sparse@vger.kernel.org,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Erico Nunes <nunes.erico@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 17, 2013 at 11:45 PM, Joe Perches <joe@perches.com> wrote:
> On Sun, 2013-11-17 at 20:34 -0200, Erico Nunes wrote:
>> Do you mean it as an error in the sparse tool?
>
> Yes.  I think it's a defect in how sparse
> treats string concatenation.
>
> That style:
>
>         printk("%s\n",
> #ifdef FOO
>         "foo"
> #endif
> #ifdef BAR
>         "bar"
> #endif
>         "string");
>
> is pretty common in the kernel sources.
>
> The patch itself is otherwise fine, but
> perhaps unnecessary.

I agree with Joe, the patch fixes a non-issue.

-- 
Thanks,
//richard
