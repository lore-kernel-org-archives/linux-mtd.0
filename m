Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCtG8-0003CL-MN
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 14:54:29 +0000
Message-ID: <1362495303.2943.56.camel@sauron>
Subject: Re: [PATCH 12/12] mtd: nand: provision full ID support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Tue, 05 Mar 2013 16:55:03 +0200
In-Reply-To: <CAMiH66EZ_grVAWa99rZoLdq1cQGbr3FrBt2SdKb8UNND96YbFw@mail.gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-13-git-send-email-dedekind1@gmail.com>
 <CAMiH66GvpQZ36wLvB_cyiSk79sPPJ+vBKba1Z6WZvi5UD4X=2g@mail.gmail.com>
 <1362480128.2943.51.camel@sauron>
 <CAMiH66EZ_grVAWa99rZoLdq1cQGbr3FrBt2SdKb8UNND96YbFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-03-05 at 22:36 +0800, Huang Shijie wrote:
> >> We can add a new helper like compare_nand_with_devid() to remove the
> >> mfr_id and dev_id, only left the id[8].
> >
> > Huang, did you miss the "union { ... }" part or you think using 'id[N]'
> > directly is readable enough?
> ｉ　ｔｈｉｎｋ　ｕｓｉｎｇ　ｔｈｅ　ｉｄ［］　ｉｓ　ｅｎｏｕｇｈ．
> ｔｈｅ　ｕｎｉｏｎ　ｉｓ　ｒｅｄｕｎｄａｎｔ．

I just find 'type->dev_id' more readable than 'type->id[1]'...

-- 
Best Regards,
Artem Bityutskiy
