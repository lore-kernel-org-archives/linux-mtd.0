Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TAwMX-0000BY-Fe
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2012 05:16:46 +0000
Received: by wgbdt14 with SMTP id dt14so1021484wgb.18
 for <linux-mtd@lists.infradead.org>; Sun, 09 Sep 2012 22:16:40 -0700 (PDT)
Message-ID: <504D77D0.70705@gmail.com>
Date: Mon, 10 Sep 2012 07:17:04 +0200
From: Sasha Levin <levinsasha928@gmail.com>
MIME-Version: 1.0
To: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: mtd: kernel BUG at arch/x86/mm/pat.c:279!
References: <1340959739.2936.28.camel@lappy>
 <CA+1xoqdgKV_sEWvUbuxagL9JEc39ZFa6X9-acP7j-M7wvW6qbQ@mail.gmail.com>
 <CA+55aFzJCLxVP+WYJM-gq=aXx5gmdgwC7=_Gr2Tooj8q+Dz4dw@mail.gmail.com>
 <1347057778.26695.68.camel@sbsiddha-desk.sc.intel.com>
 <CA+55aFwW9Q+DM2gZy7r3JQJbrbMNR6sN+jewc2CY0i1wD_X=Tw@mail.gmail.com>
 <1347062045.26695.82.camel@sbsiddha-desk.sc.intel.com>
 <CA+55aFzeKcV5hROLJE31dNi3SEs+s6o0LL=96Kh8QGHPx=aZnA@mail.gmail.com>
 <504CCA31.2000003@zytor.com>
In-Reply-To: <504CCA31.2000003@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Suresh Siddha <suresh.b.siddha@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, linux-mtd@lists.infradead.org,
 Dave Jones <davej@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/09/2012 06:56 PM, H. Peter Anvin wrote:
>>
>> Anyway, that means that the BUG_ON() is likely bogus, but so is the
>> whole calling convention.
>>
>> The 4kB range starting at 0xfffffffffffff000 sounds like a *valid*
>> range, but that requires that we fix the calling convention to not
>> have that "end" (exclusive) thing. It should either be "end"
>> (inclusive), or just "len".
>>
> 
> On x86, it is definitely NOT a valid range.  There is no physical addresses
> there, and there will never be any.

This reminds me a similar issue: If you try to mmap /dev/kmem at an offset which
is not kernel owned (such as 0), you'll get all the way to __pa() before getting
a BUG() about addresses not making sense.

How come there's no arch-specific validation of attempts to access
virtual/physical addresses? In the kmem example I'd assume that something very
early on should be yelling at me about doing something like that, but for some
reason I get all the way to __pa() before getting a BUG() (!).


Thanks,
Sasha
