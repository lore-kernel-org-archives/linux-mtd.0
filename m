Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZ3B7-00008q-28
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2016 21:10:29 +0000
Received: by mail-ob0-x22f.google.com with SMTP id jq7so60156233obb.0
 for <linux-mtd@lists.infradead.org>; Thu, 25 Feb 2016 13:10:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1456397391.4719.30.camel@gmail.com>
References: <7F9DB42F7DDA544EA3EB31D694929A30EB84DA@PERU.autotrac.corp>
 <1456397391.4719.30.camel@gmail.com>
Date: Thu, 25 Feb 2016 22:10:08 +0100
Message-ID: <CAFLxGvwmRSHG1r9CAKa+1q-H2AWtZpS_Lgj2VTRcJfNZCG8JDw@mail.gmail.com>
Subject: Re: Filesystems over UBI can't handle badblocks
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Guilherme de Oliveira Costa <guilherme.oliveira@autotrac.com.br>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 25, 2016 at 11:49 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Now, how to do it via UBI? I think this is not supported, but it can be
> implemented, I believe.

Implementing this is rather easy. But what exactly is the use case?
If one wants to test UBI wrt. to bad blocks I could think of a debugfs
knob to do so,
tst_emulate_bitflips can already trigger bad block marking btw.

-- 
Thanks,
//richard
