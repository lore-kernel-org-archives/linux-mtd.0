Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCwlh-0002wG-Jq
 for linux-mtd@lists.infradead.org; Wed, 08 Jul 2015 21:20:37 +0000
Received: by oiab3 with SMTP id b3so57509994oia.1
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jul 2015 14:20:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1436389195-16522-1-git-send-email-xerofoify@gmail.com>
References: <1436389195-16522-1-git-send-email-xerofoify@gmail.com>
Date: Wed, 8 Jul 2015 23:20:16 +0200
Message-ID: <CAFLxGvy+-rWQzxgHFq86bH47YM3KEU2yUh1QdJhbA4JtHkT7QA@mail.gmail.com>
Subject: Re: [PATCH] jffs2:Fix error paths return value for the function
 read_unknown
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Nicholas Krause <xerofoify@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 8, 2015 at 10:59 PM, Nicholas Krause <xerofoify@gmail.com> wrote:
> This fixes the error paths in the function read_unknown that return
> a value to correctly return -EIO rather then the kernel value for
> successful function execution of zero to indicate to this function's
> callers that a failure has occurred related to I/O and needs to be
> handled by this function's caller.

Did you test this patch?
I guess not.

-- 
Thanks,
//richard
