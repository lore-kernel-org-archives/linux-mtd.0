Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dLAiz-000817-AD
 for linux-mtd@lists.infradead.org; Wed, 14 Jun 2017 16:00:55 +0000
Subject: Re: [PATCH] ubifs : fix oops when remounting with no_bulk_read.
To: karam.lee@lge.com, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: "seungho.park" <seungho1.park@lge.com>
References: <1497231991-4794-1-git-send-email-karam.lee@lge.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <7852fe56-7193-f767-8aa7-6691a531087a@nod.at>
Date: Wed, 14 Jun 2017 18:00:20 +0200
MIME-Version: 1.0
In-Reply-To: <1497231991-4794-1-git-send-email-karam.lee@lge.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

karam.lee,

Am 12.06.2017 um 03:46 schrieb karam.lee@lge.com:
> From: "karam.lee" <karam.lee@lge.com>
> 
> When remounting with the no_bulk_read option,
> there is a problem accessing the "bulk_read buffer(bu.buf)"
> which has already been freed.
> 
> If the bulk_read option is enabled,
> ubifs_tnc_bulk_read uses the pre-allocated bu.buf.
> 
> While bu.buf is being used by ubifs_tnc_bulk_read,
> remounting with no_bulk_read frees bu.buf.
> 
> So I added code to check the use of "bu.buf" to avoid this situation.

Agreed. We need to lock the buffer in this situation.
Thanks for fixing this.

Thanks,
//richard
