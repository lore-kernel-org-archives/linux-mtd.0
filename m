Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIcWO-00060I-Nd
 for linux-mtd@lists.infradead.org; Fri, 02 Nov 2018 16:42:10 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 00/42] mtd-utils: Add fscrypt support to mkfs.ubifs
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <20181018143718.26298-1-richard@nod.at>
Message-ID: <14ba6760-1d30-3814-408b-089667ccec1f@sigma-star.at>
Date: Fri, 2 Nov 2018 17:41:44 +0100
MIME-Version: 1.0
In-Reply-To: <20181018143718.26298-1-richard@nod.at>
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

Hi!

This patch set has been sitting on the ML for more than two weeks now, with no
one commenting/complaining/nit-picking/bike-shedding/etc, so I'll push it to
mtd-utils.git master.

Since I authored some of those commits and already stared at the whole patch
set for quite some time before it's been submitted, I'm not sure how helpful
it is for me to try and review it now. Nevertheless, I've looked through the
patch set again over the last few days, compared it against the latest version
I have locally and did some quick tests and it still looks good to me.

Thanks,

David
