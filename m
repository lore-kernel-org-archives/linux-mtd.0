Received: from lvk-gate.cmc.msu.ru ([188.44.42.233] helo=mail.lvk.cs.msu.su)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Si8sO-0007XU-6G
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 18:46:38 +0000
From: "Nikita V. Youshchenko" <nyoushchenko@mvista.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: ubi_update_fastmap: could not find an early PEB
Date: Fri, 22 Jun 2012 22:46:22 +0400
References: <201206222005.02308@blacky.localdomain>
 <201206222126.12515@blacky.localdomain> <4FE4AD74.1040907@nod.at>
In-Reply-To: <4FE4AD74.1040907@nod.at>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201206222246.23389@blacky.localdomain>
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

> Hi!
>
> Am 22.06.2012 19:26, schrieb Nikita V. Youshchenko:
> > Where to get that?
>
> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v12

Tried code from there, plus patch you've sent, and still getting

# ubidetach /dev/ubi_ctrl -m 2
UBI error: ubi_update_fastmap: could not find an anchor PEB
UBI warning: ubi_update_fastmap: Unable to write new fastmap, err=-28
UBI: mtd2 is detached from ubi0

Nkita
