Received: from mail-qg0-x22f.google.com ([2607:f8b0:400d:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkbu9-0003Lz-PA
 for linux-mtd@lists.infradead.org; Wed, 14 May 2014 16:19:42 +0000
Received: by mail-qg0-f47.google.com with SMTP id j107so3146255qga.6
 for <linux-mtd@lists.infradead.org>; Wed, 14 May 2014 09:19:20 -0700 (PDT)
Date: Wed, 14 May 2014 09:19:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
Subject: Re: [PATCH v3] mtd: lpddr: add driver for LPDDR2-NVM PCM memories
Message-ID: <20140514161917.GJ28907@ld-irv-0074>
References: <1399670397-2247-1-git-send-email-vincenzo.aliberti@gmail.com>
 <20140512183044.GK28907@ld-irv-0074>
 <CADBu1QsUj4m2Vz_Dot6HSp-dDJ8QDO6+PTgC1+6CW=r=-KjUYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADBu1QsUj4m2Vz_Dot6HSp-dDJ8QDO6+PTgC1+6CW=r=-KjUYw@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, May 14, 2014 at 09:44:38AM +0200, Vincenzo Aliberti wrote:
> Hi Brian,
>    your feedback looks great! Thanks!
> 
> Only one concern: I have been forced to test it on a 3.10_rc4 version
> of the Kernel and in order to use
> IS_ERR and PTR_ERR functions I had to add:
> 
> #include <linux/err.h>
> 
> On the 3.14 I expect it should be the same, which is your feeling?

Yeah, I missed the #include. It must have been included implicitly by
another header. But it should be included explicitly.

> Do you wnat I send a v4 of this patch?

Please do.

Brian
