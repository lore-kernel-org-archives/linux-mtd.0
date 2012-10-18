Received: from 16.mo3.mail-out.ovh.net ([188.165.56.217]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TOmeA-0007Zl-UP
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2012 09:44:12 +0000
Received: from mail612.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id D2E21FF995C
 for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2012 11:53:36 +0200 (CEST)
Date: Thu, 18 Oct 2012 11:41:49 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/1] MTD: atmel_nand: use devm_xxx gpio kzalloc, gpio
 and ioremap
Message-ID: <20121018094149.GF12801@game.jcrosoft.org>
References: <1350129982-12106-1-git-send-email-plagnioj@jcrosoft.com>
 <1350552998.5769.306.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1350552998.5769.306.camel@sauron.fi.intel.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12:36 Thu 18 Oct     , Artem Bityutskiy wrote:
> On Sat, 2012-10-13 at 14:06 +0200, Jean-Christophe PLAGNIOL-VILLARD
> wrote:
> > this will allow to simply the error and remove path
> > 
> > Cc: linux-mtd@lists.infradead.org
> > Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> 
> $:~/git/l2-mtd$ git apply --check ~/tmp/jc.mbox
> error: patch failed: drivers/mtd/nand/atmel_nand.c:1420
> error: drivers/mtd/nand/atmel_nand.c: patch does not apply
> 
> Please, send an l2-mtd.git-based version.
> 
> git://git.infradead.org/users/dedekind/l2-mtd-2.6.git
this will have to be merge after pinctrl

it's ok I'll push it via at91

Best Regards,
J.
