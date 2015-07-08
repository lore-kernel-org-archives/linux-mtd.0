Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCwmP-00035N-I6
 for linux-mtd@lists.infradead.org; Wed, 08 Jul 2015 21:21:22 +0000
Received: by igau2 with SMTP id u2so74143174iga.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jul 2015 14:21:00 -0700 (PDT)
Message-ID: <559D943B.1030708@gmail.com>
Date: Wed, 08 Jul 2015 17:20:59 -0400
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] jffs2:Fix error paths return value for the function
 read_unknown
References: <1436389195-16522-1-git-send-email-xerofoify@gmail.com>
 <CAFLxGvy+-rWQzxgHFq86bH47YM3KEU2yUh1QdJhbA4JtHkT7QA@mail.gmail.com>
In-Reply-To: <CAFLxGvy+-rWQzxgHFq86bH47YM3KEU2yUh1QdJhbA4JtHkT7QA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2015-07-08 05:20 PM, Richard Weinberger wrote:
> On Wed, Jul 8, 2015 at 10:59 PM, Nicholas Krause <xerofoify@gmail.com> wrote:
>> This fixes the error paths in the function read_unknown that return
>> a value to correctly return -EIO rather then the kernel value for
>> successful function execution of zero to indicate to this function's
>> callers that a failure has occurred related to I/O and needs to be
>> handled by this function's caller.
> 
> Did you test this patch?
> I guess not.
> 
No I don't have hardware why?
Nick
