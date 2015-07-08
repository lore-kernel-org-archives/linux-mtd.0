Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCwsR-0006fE-O0
 for linux-mtd@lists.infradead.org; Wed, 08 Jul 2015 21:27:37 +0000
Message-ID: <559D95AF.8060500@nod.at>
Date: Wed, 08 Jul 2015 23:27:11 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: nick <xerofoify@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] jffs2:Fix error paths return value for the function
 read_unknown
References: <1436389195-16522-1-git-send-email-xerofoify@gmail.com>
 <CAFLxGvy+-rWQzxgHFq86bH47YM3KEU2yUh1QdJhbA4JtHkT7QA@mail.gmail.com>
 <559D943B.1030708@gmail.com>
In-Reply-To: <559D943B.1030708@gmail.com>
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

Am 08.07.2015 um 23:20 schrieb nick:
> 
> 
> On 2015-07-08 05:20 PM, Richard Weinberger wrote:
>> On Wed, Jul 8, 2015 at 10:59 PM, Nicholas Krause <xerofoify@gmail.com> wrote:
>>> This fixes the error paths in the function read_unknown that return
>>> a value to correctly return -EIO rather then the kernel value for
>>> successful function execution of zero to indicate to this function's
>>> callers that a failure has occurred related to I/O and needs to be
>>> handled by this function's caller.
>>
>> Did you test this patch?
>> I guess not.
>>
> No I don't have hardware why?

It is broken.
Both paths are not fatal errors and the soft error
is already handled by calling jffs2_mark_node_obsolete().

Thanks,
//richard
