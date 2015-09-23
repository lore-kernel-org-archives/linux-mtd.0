Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZedNn-0000F6-Vi
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2015 06:18:25 +0000
Subject: Re: [Resend PATCH 0/2] UBIFS: two trivial fix
To: Sheng Yong <shengyong1@huawei.com>, dedekind1@gmail.com
References: <1442999500-5343-1-git-send-email-shengyong1@huawei.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <56024416.6090806@nod.at>
Date: Wed, 23 Sep 2015 08:17:58 +0200
MIME-Version: 1.0
In-Reply-To: <1442999500-5343-1-git-send-email-shengyong1@huawei.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 23.09.2015 um 11:11 schrieb Sheng Yong:
> Sheng Yong (2):
>   UBIFS: call dbg_is_power_cut() instead of reading c->dbg->pc_happened
>   UBIFS: print verbose message when rescanning a corrupted node
> 
>  fs/ubifs/debug.c    | 8 ++++----
>  fs/ubifs/recovery.c | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Patches look good to me. :-)
Artem, I'd queue them for v4.4, ok?

Thanks,
//richard
