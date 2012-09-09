Received: from terminus.zytor.com ([2001:1868:205::10] helo=mail.zytor.com)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TAoCW-0005ej-SY
 for linux-mtd@lists.infradead.org; Sun, 09 Sep 2012 20:33:53 +0000
Message-ID: <504CFD22.3050300@zytor.com>
Date: Sun, 09 Sep 2012 13:33:38 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: mtd: kernel BUG at arch/x86/mm/pat.c:279!
References: <1340959739.2936.28.camel@lappy>
 <CA+1xoqdgKV_sEWvUbuxagL9JEc39ZFa6X9-acP7j-M7wvW6qbQ@mail.gmail.com>
 <CA+55aFzJCLxVP+WYJM-gq=aXx5gmdgwC7=_Gr2Tooj8q+Dz4dw@mail.gmail.com>
 <1347057778.26695.68.camel@sbsiddha-desk.sc.intel.com>
 <CA+55aFwW9Q+DM2gZy7r3JQJbrbMNR6sN+jewc2CY0i1wD_X=Tw@mail.gmail.com>
 <1347062045.26695.82.camel@sbsiddha-desk.sc.intel.com>
 <CA+55aFzeKcV5hROLJE31dNi3SEs+s6o0LL=96Kh8QGHPx=aZnA@mail.gmail.com>
 <504CCA31.2000003@zytor.com>
 <1347217472.2068.35.camel@shinybook.infradead.org>
In-Reply-To: <1347217472.2068.35.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Suresh Siddha <suresh.b.siddha@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, linux-mtd@lists.infradead.org,
 Sasha Levin <levinsasha928@gmail.com>, Dave Jones <davej@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/09/2012 12:04 PM, David Woodhouse wrote:
> On Sun, 2012-09-09 at 09:56 -0700, H. Peter Anvin wrote:
>>
>>> So it should either be start=0xfffffffffffff000 end=0xffffffffffffffff
>>> or it should be start=0xfffffffffffff000 len=0x1000.
>>
>> I would strongly object to the former; that kind of inclusive ranges
>> breed a whole class of bugs by themselves.
>
> Another alternative that avoids overflow issues is to use a PFN rather
> than a byte address.
>

Except as a result of that logic have a bunch of places which either 
have rounding errors in how they calculate PFNs, or they think they can 
stick PFNs into 32-bit numbers.  :(

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
