Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wn0yO-00071d-3r
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 07:30:01 +0000
Message-ID: <537C55DC.6090808@nod.at>
Date: Wed, 21 May 2014 09:29:32 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] UBI: fastmap: correct error check
References: <1400650538-11234-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1400650538-11234-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.05.2014 07:35, schrieb Brian Norris:
> The return value from ubi_io_read_ec_hdr() was stored in 'err', not in
> 'ret'.
> 
> This issue was reported by Coverity Scan.

I begin to love Coverity. :-)
Thanks for the patch, Brian!

> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
