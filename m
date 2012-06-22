Received: from lvk-gate.cmc.msu.ru ([188.44.42.233] helo=mail.lvk.cs.msu.su)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Si7co-0003n8-0H
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 17:26:27 +0000
From: "Nikita V. Youshchenko" <nyoushchenko@mvista.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: ubi_update_fastmap: could not find an early PEB
Date: Fri, 22 Jun 2012 21:26:11 +0400
References: <201206222005.02308@blacky.localdomain> <4FE49E19.4070005@nod.at>
In-Reply-To: <4FE49E19.4070005@nod.at>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201206222126.12515@blacky.localdomain>
Cc: Rob Taylor <rtaylor@mvista.com>, Alexander Kaliadin <akaliadin@mvista.com>,
 linux-mtd@lists.infradead.org, Pavan Jadhav <pjadhav@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > How to overcome this?
>
> Can you please try the attached patch?
> This patch allows the WL-worker to produce free anchor PEBS.

This patch does not apply against 'fastmap' branch of 
git://git.infradead.org/linux-ubi.git

And incompatibility is big enough to be not obviously resolvable.

> P.s: Please use the most current fastmap code!

Where to get that?

Nikita
