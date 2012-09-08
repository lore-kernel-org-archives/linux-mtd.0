Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TAG7c-0004Xk-JE
 for linux-mtd@lists.infradead.org; Sat, 08 Sep 2012 08:10:33 +0000
Received: by eekc13 with SMTP id c13so146912eek.36
 for <linux-mtd@lists.infradead.org>; Sat, 08 Sep 2012 01:10:29 -0700 (PDT)
Message-ID: <504AFD8E.50701@gmail.com>
Date: Sat, 08 Sep 2012 10:10:54 +0200
From: Sasha Levin <levinsasha928@gmail.com>
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: mtd: kernel BUG at arch/x86/mm/pat.c:279!
References: <1340959739.2936.28.camel@lappy>
 <CA+1xoqdgKV_sEWvUbuxagL9JEc39ZFa6X9-acP7j-M7wvW6qbQ@mail.gmail.com>
 <CA+55aFzJCLxVP+WYJM-gq=aXx5gmdgwC7=_Gr2Tooj8q+Dz4dw@mail.gmail.com>
 <1347057778.26695.68.camel@sbsiddha-desk.sc.intel.com>
 <CA+55aFwW9Q+DM2gZy7r3JQJbrbMNR6sN+jewc2CY0i1wD_X=Tw@mail.gmail.com>
In-Reply-To: <CA+55aFwW9Q+DM2gZy7r3JQJbrbMNR6sN+jewc2CY0i1wD_X=Tw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Suresh Siddha <suresh.b.siddha@intel.com>,
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

On 09/08/2012 01:09 AM, Linus Torvalds wrote:
> Sasha, since you can apparently reproduce it, can you replace the
> "BUG_ON()" with just a
> 
>  if (start >= end) {
>     printf("bogus range %llx - %llx\n", start, end);
>     return -EINVAL;
>   }

Replacing it gives me the following:

[   36.231736] bogus range fffffffffffff000 - 0


Thanks,
Sasha
