Received: from lvk-gate.cmc.msu.ru ([188.44.42.233] helo=mail.lvk.cs.msu.su)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjq6G-0006mG-I2
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 11:07:58 +0000
From: "Nikita V. Youshchenko" <nyoushchenko@mvista.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: ubi_update_fastmap: could not find an early PEB
Date: Wed, 27 Jun 2012 15:07:40 +0400
References: <201206222005.02308@blacky.localdomain>
 <1340794586.29342.52.camel@sauron.fi.intel.com> <4FEAE7CD.6060803@nod.at>
In-Reply-To: <4FEAE7CD.6060803@nod.at>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201206271507.42980@zigzag.lvk.cs.msu.su>
Cc: Rob Taylor <rtaylor@mvista.com>, Alexander Kaliadin <akaliadin@mvista.com>,
 linux-mtd@lists.infradead.org, Pavan Jadhav <pjadhav@mvista.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Especially the size of both pools used by fastmap needs to be discussed
> more. If the pool size is too small UBI was to write the fastmap very
> often. A too large pool means that attaching takes longer because
> fastmap has to rescan more PEBs.

I'd prefer to see those configurable.

I see two obvious cases when different settings are needed.

First is system that has very little changes at runtime. Maybe as small as 
save user settings if he ever changes those. Everything else is readonly. 
Then, better to have lower pool size to make attach faster.

Second is system with extensice writes expected. Then indeed pool needs to 
be larger to avoid too often fastmap writes.

Nikita
