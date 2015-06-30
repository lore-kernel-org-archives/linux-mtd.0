Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9q1r-0005U3-IW
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 07:32:28 +0000
Message-ID: <559245F3.3010506@nod.at>
Date: Tue, 30 Jun 2015 09:32:03 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, computersforpeace@gmail.com
Subject: Re: [PATCH 2/2] mtd-utils: ubi-tests: fix a some overflows
References: <1435567759-32518-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1435567759-32518-2-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1435567759-32518-2-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 29.06.2015 um 10:49 schrieb Dongsheng Yang:
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  tests/ubi-tests/mkvol_bad.c   | 2 +-
>  tests/ubi-tests/mkvol_basic.c | 2 +-
>  tests/ubi-tests/rsvol.c       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
