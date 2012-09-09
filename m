Received: from terminus.zytor.com ([2001:1868:205::10] helo=mail.zytor.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TAktF-0001mi-NS
 for linux-mtd@lists.infradead.org; Sun, 09 Sep 2012 17:01:46 +0000
Message-ID: <504CCB6D.7070005@zytor.com>
Date: Sun, 09 Sep 2012 10:01:33 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: mtd: kernel BUG at arch/x86/mm/pat.c:279!
References: <1340959739.2936.28.camel@lappy>
 <CA+1xoqdgKV_sEWvUbuxagL9JEc39ZFa6X9-acP7j-M7wvW6qbQ@mail.gmail.com>
 <CA+55aFzJCLxVP+WYJM-gq=aXx5gmdgwC7=_Gr2Tooj8q+Dz4dw@mail.gmail.com>
 <1347057778.26695.68.camel@sbsiddha-desk.sc.intel.com>
 <CA+55aFwW9Q+DM2gZy7r3JQJbrbMNR6sN+jewc2CY0i1wD_X=Tw@mail.gmail.com>
 <1347062045.26695.82.camel@sbsiddha-desk.sc.intel.com>
 <CA+55aFzeKcV5hROLJE31dNi3SEs+s6o0LL=96Kh8QGHPx=aZnA@mail.gmail.com>
 <1347202600.5876.7.camel@sbsiddha-ivb>
 <CA+55aFwej93o7aLe_xwV5CGuT0BDyAz54cyWm6Xe3wj-hCT3PA@mail.gmail.com>
In-Reply-To: <CA+55aFwej93o7aLe_xwV5CGuT0BDyAz54cyWm6Xe3wj-hCT3PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: suresh.b.siddha@intel.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, linux-mtd@lists.infradead.org,
 Sasha Levin <levinsasha928@gmail.com>, Dave Jones <davej@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/09/2012 08:31 AM, Linus Torvalds wrote:
> On Sun, Sep 9, 2012 at 7:56 AM, Suresh Siddha <suresh.b.siddha@intel.com> wrote:
>>
>> yes but that is not a valid range I think because of the supported
>> physical address bit limits of the processor and also the max
>> architecture limit of 52 address bits.
>
> But how could the caller possibly know that? None of those internal
> PAT limits are exposed anywhere.
>
> So doing the BUG_ON() is wrong. I'd suggest changing it to an EINVAL.
>
> In fact, BUG_ON() is *always* wrong, unless it's a "my internal data
> structures are so messed up that I cannot continue".
>

I suspect the right answer is doing something like:

	u64 max_phys = 1ULL << boot_cpu_data.x86_phys_bits;

	if (start >= max_phys || end > max_phys || start >= end)
		return -EINVAL;

... although max_phys perhaps should be precalculated and stored in 
struct cpuinfo_x86 instead of being generated de novo.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
