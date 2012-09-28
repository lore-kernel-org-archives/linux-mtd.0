Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1THg25-00005r-Tp
 for linux-mtd@lists.infradead.org; Fri, 28 Sep 2012 19:15:30 +0000
Received: by bkwj4 with SMTP id j4so3644476bkw.36
 for <linux-mtd@lists.infradead.org>; Fri, 28 Sep 2012 12:15:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1348859054.2036.122.camel@shinybook.infradead.org>
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
 <1348859054.2036.122.camel@shinybook.infradead.org>
Date: Fri, 28 Sep 2012 21:15:27 +0200
Message-ID: <CAFLxGvxy2V9=4U1YePUm17Z=BF=SzLsO9Catmh-DcOkbMfuSNg@mail.gmail.com>
Subject: Re: mtd: kernel BUG at arch/x86/mm/pat.c:279!
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: suresh.b.siddha@intel.com,
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

On Fri, Sep 28, 2012 at 9:04 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Fri, 2012-09-28 at 09:44 -0700, Linus Torvalds wrote:
>> On Fri, Sep 28, 2012 at 2:00 AM, Sasha Levin <levinsasha928@gmail.com> wrote:
>> >
>> > Is anyone planning on picking up Linus' patch? This is still not in -next even.
>>
>> I was really hoping it would go through the regular channels and come
>> back to me that way, since I can't really test it, and it's bigger
>> than the trivial obvious one-liners that I'm happy to commit.
>
> I can't test it on real hardware here either, but I can pull it through
> my tree.

If you can a easy test-case I can test it on real hardware.

-- 
Thanks,
//richard
