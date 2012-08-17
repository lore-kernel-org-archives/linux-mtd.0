Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2UL8-0008Py-1A
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 21:44:22 +0000
Received: by pbbrq8 with SMTP id rq8so4179007pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2012 14:44:19 -0700 (PDT)
MIME-Version: 1.0
Sender: dsdrake@gmail.com
In-Reply-To: <1340018702.2420.32.camel@sauron.fi.intel.com>
References: <20120609160825.GC6488@elgon.mountain>
 <1340018702.2420.32.camel@sauron.fi.intel.com>
Date: Fri, 17 Aug 2012 15:44:19 -0600
Message-ID: <CAMLZHHSDCC1MWBLUCrpXHU_EtRPw3bf1kOTFWS-NE8q3Ane41w@mail.gmail.com>
Subject: Re: [patch] mtd: cafe_nand: fix an & vs | mistake
From: Daniel Drake <dsd@laptop.org>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 18, 2012 at 5:25 AM, Artem Bityutskiy
<artem.bityutskiy@linux.intel.com> wrote:
> Pushed this patch to l2-mtd.git and added CC to -stable. The patch seems
> to be a real bug-fix. Daniel, could you please check it - it will be
> shame if it hits -stable and breaks something.

Thanks for catching this, sorry for the delay in looking closely at
it. I double-checked the device specifications and indeed, Dan's
interpretation is correct.

I also tested the patch. System still remains functional and basic
nand performance seems to be the same.

Thanks!
Daniel
