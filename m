Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKSLj-0001KU-PW
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 18:14:45 +0000
Received: by mail-wm1-x344.google.com with SMTP id 124-v6so10104373wmw.0
 for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2018 10:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20181106214928.40020-1-nkela@cisco.com>
 <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
 <591D4732-BC3E-4F85-9277-25E049FFF4BA@cisco.com>
In-Reply-To: <591D4732-BC3E-4F85-9277-25E049FFF4BA@cisco.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 7 Nov 2018 19:14:20 +0100
Message-ID: <CAFLxGvz8QgK1P6d-_biSRk4fyYEobio315_tUP+cRXTvt+m1hA@mail.gmail.com>
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
To: nkela@cisco.com
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, xe-linux-external@cisco.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 7, 2018 at 7:05 PM Nikunj Kela (nkela) <nkela@cisco.com> wrote:
> I had tried to use configs to start with via the following patch however I was advised to have a mount option:
> http://lists.infradead.org/pipermail/linux-mtd/2018-November/085126.html

Just show performance numbers on how your implementation has an impact or not.
So far your implementation is also not much optimized, maybe likely()
or static keys can help...

-- 
Thanks,
//richard
