Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1THgUA-0004Th-Mw
 for linux-mtd@lists.infradead.org; Fri, 28 Sep 2012 19:44:31 +0000
Received: by eaan13 with SMTP id n13so659411eaa.36
 for <linux-mtd@lists.infradead.org>; Fri, 28 Sep 2012 12:44:27 -0700 (PDT)
Message-ID: <5065FE29.5080302@gmail.com>
Date: Fri, 28 Sep 2012 21:44:41 +0200
From: Sasha Levin <levinsasha928@gmail.com>
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
 <1347202600.5876.7.camel@sbsiddha-ivb> <505068F4.4080309@gmail.com>
 <50506A6C.30109@gmail.com> <50656733.3040609@gmail.com>
 <CA+55aFyWdxD4Qb9PuPKKx_Ww_khYkWg1s-3QWVUwsTSXSUMG5w@mail.gmail.com>
 <1348855547.1556.3.camel@kyv>
 <CA+55aFwDWcQv9DBCQhMrcK-zx75qBN11iQhq5dxt+orosmeXbg@mail.gmail.com>
In-Reply-To: <CA+55aFwDWcQv9DBCQhMrcK-zx75qBN11iQhq5dxt+orosmeXbg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: suresh.b.siddha@intel.com, Artem Bityutskiy <dedekind1@gmail.com>,
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

On 09/28/2012 09:13 PM, Linus Torvalds wrote:
> On Fri, Sep 28, 2012 at 11:05 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>>
>> I am not the maintainer, but please, go ahead an push your fix. I do not
>> have time to test it myself and it does not look like anyone else in the
>> small mtd community does.
> 
> Grr. I told people that patch wasn't tested. I hadn't even *compiled*
> it. It has a typo ("inlint" instead of "inline" - so close).
> 
> Sasha said he had tested it, but nobody even mentioned this thing. Now
> I'm nervous. I had committed it in my tree and was just about to push
> it out when I decided that I should at least compile it despite the
> "tested-by".
> 
> Hmm? Now I really *really* want to know that it's been tested on
> actual hardware too. Sasha, what patch did you actually test? Did you
> just fix the "inlint" thing, or was there something else entirely?

I've just fixed the inlint thing since it was pretty trivial, I didn't bother commenting on it since I figured it would turn into
an actual patch from someone who could test it on actual hardware first.

Note that I've tested it on a KVM guest, and not on real hardware - so I'm not sure how much of a test that is.


Thanks,
Sasha
