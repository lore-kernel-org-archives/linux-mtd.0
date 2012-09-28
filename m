Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1THWQq-0008HP-2X
 for linux-mtd@lists.infradead.org; Fri, 28 Sep 2012 09:00:25 +0000
Received: by bkwj4 with SMTP id j4so2867401bkw.36
 for <linux-mtd@lists.infradead.org>; Fri, 28 Sep 2012 02:00:20 -0700 (PDT)
Message-ID: <50656733.3040609@gmail.com>
Date: Fri, 28 Sep 2012 11:00:35 +0200
From: Sasha Levin <levinsasha928@gmail.com>
MIME-Version: 1.0
To: suresh.b.siddha@intel.com
Subject: Re: mtd: kernel BUG at arch/x86/mm/pat.c:279!
References: <1340959739.2936.28.camel@lappy>
 <CA+1xoqdgKV_sEWvUbuxagL9JEc39ZFa6X9-acP7j-M7wvW6qbQ@mail.gmail.com>
 <CA+55aFzJCLxVP+WYJM-gq=aXx5gmdgwC7=_Gr2Tooj8q+Dz4dw@mail.gmail.com>
 <1347057778.26695.68.camel@sbsiddha-desk.sc.intel.com>
 <CA+55aFwW9Q+DM2gZy7r3JQJbrbMNR6sN+jewc2CY0i1wD_X=Tw@mail.gmail.com>
 <1347062045.26695.82.camel@sbsiddha-desk.sc.intel.com>
 <CA+55aFzeKcV5hROLJE31dNi3SEs+s6o0LL=96Kh8QGHPx=aZnA@mail.gmail.com>
 <1347202600.5876.7.camel@sbsiddha-ivb> <505068F4.4080309@gmail.com>
 <50506A6C.30109@gmail.com>
In-Reply-To: <50506A6C.30109@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
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

On 09/12/2012 12:56 PM, Sasha Levin wrote:
> On 09/12/2012 12:50 PM, Sasha Levin wrote:
>> On 09/09/2012 04:56 PM, Suresh Siddha wrote:
>>> On Sat, 2012-09-08 at 12:57 -0700, Linus Torvalds wrote:
>>>>> Whatever. Something like this (TOTALLY UNTESTED) attached patch should
>>>>> get the mtdchar overflows to go away, 
>>> It looks good to me. Acked-by: Suresh Siddha <suresh.b.siddha@intel.com>
>>>
>>> Sasha, can you please give this a try?
>>
>> Sorry for the delay. It looks good here.
>>
>>
>> Thanks,
>> Sasha
>>
> 
> Uh... sorry again, I obviously tested the second patch sent by Linus but
> mistakingly replied to the wrong mail in the thread.

Is anyone planning on picking up Linus' patch? This is still not in -next even.


Thanks,
Sasha
