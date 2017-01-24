Received: from mail-ot0-f180.google.com ([74.125.82.180])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cW9TV-0001TF-CA
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 22:22:05 +0000
Received: by mail-ot0-f180.google.com with SMTP id 65so138675439otq.2
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jan 2017 14:21:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <VI1PR08MB1022F25C7F26E465355F07149C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
References: <VI1PR08MB1022F25C7F26E465355F07149C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 24 Jan 2017 23:20:39 +0100
Message-ID: <CAFLxGvwJrLR8-5QSfzL3TBk_kwLSUq+DarCB5XWbn+LKiK53dQ@mail.gmail.com>
Subject: Re: fs/jffs2/readinode.c:189: faulty logic ?
To: David Binderman <dcb314@hotmail.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

On Tue, Jan 24, 2017 at 9:15 AM, David Binderman <dcb314@hotmail.com> wrote:
> Hello there,
>
> fs/jffs2/readinode.c:189]: (style) Condition 'tn.fn.ofs>=offset' is always true

What tool produces this info?

> Source code is
>
>         if (tn->fn->ofs < offset)
>             next = tn->rb.rb_right;
>         else if (tn->fn->ofs >= offset)
>             next = tn->rb.rb_left;
>         else
>             break;
>
> Maybe better code
>
>         if (tn->fn->ofs < offset)
>             next = tn->rb.rb_right;
>         else if (tn->fn->ofs > offset)
>             next = tn->rb.rb_left;
>         else
>             break;

That code is odd, yes. But we need more info.
Why is fn.fn.ofs>=offset always true?
AFAICT tn->fn->ofs > offset can be also true but
else break is never reached.

-- 
Thanks,
//richard
