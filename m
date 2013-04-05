Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UO474-0000KQ-5i
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2013 10:43:18 +0000
Message-ID: <1365158693.626.30.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: subpage write support for hardware based ECC
 schemes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>, Roland Stigge <stigge@antcom.de>
Date: Fri, 05 Apr 2013 13:44:53 +0300
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9A8CE8@DBDE01.ent.ti.com>
References: <1363352378-2825-1-git-send-email-pekon@ti.com>
 <1365088578.626.11.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9A8CE8@DBDE01.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-04-05 at 09:07 +0000, Gupta, Pekon wrote:
>  > You need to update cafe_nand.c accordingly. Aiaiai detected this:
> > 
> > Artem Bityutskiy
> 
> Thanks Aiaiai, Artem, 

Pushed this one to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
