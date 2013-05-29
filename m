Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhfUv-0004nP-CH
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 12:28:57 +0000
Message-ID: <1369830705.24286.22.camel@sauron.fi.intel.com>
Subject: Re: nand_base: fix for ONFI chips that do not support GET/SET FEATURES
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: David Mosberger-Tang <dmosberger@gmail.com>
Date: Wed, 29 May 2013 15:31:45 +0300
In-Reply-To: <CACwUX0N5dhEBU9S_g6ZUWjvoEWndU7L+4PrmiFRg5sZjmCG0DQ@mail.gmail.com>
References: <CACwUX0NbKtBCFrjKBFd307D6=EbBZQbE4w25GSAzop0FsBM2LQ@mail.gmail.com>
 <5181CF32.1090502@freescale.com>
 <CACwUX0M_CGStWih0qcR_8na-yMmvHrAaHxpYe4Y_Q5mx+jno+g@mail.gmail.com>
 <5181D25C.2080001@freescale.com>
 <CACwUX0ObapqNuV=D_8nMT6Pbr-PQhkC=ZfuVMWEOtGUcyzt8tg@mail.gmail.com>
 <CACwUX0N5dhEBU9S_g6ZUWjvoEWndU7L+4PrmiFRg5sZjmCG0DQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-01 at 21:49 -0600, David Mosberger-Tang wrote:
> Sorry, try this one instead.

Pushed, thanks, but please, next time send patches in-line in a form
which is consumable by 'git am'. Thanks!

-- 
Best Regards,
Artem Bityutskiy
