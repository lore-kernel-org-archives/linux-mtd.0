Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zedo4-0001FE-DU
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2015 06:45:33 +0000
Message-ID: <1442990709.19983.189.camel@gmail.com>
Subject: Re: [Resend PATCH 0/2] UBIFS: two trivial fix
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Sheng Yong <shengyong1@huawei.com>
Cc: linux-mtd@lists.infradead.org
Date: Wed, 23 Sep 2015 09:45:09 +0300
In-Reply-To: <56024416.6090806@nod.at>
References: <1442999500-5343-1-git-send-email-shengyong1@huawei.com>
 <56024416.6090806@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2015-09-23 at 08:17 +0200, Richard Weinberger wrote:
> Am 23.09.2015 um 11:11 schrieb Sheng Yong:
> > Sheng Yong (2):
> >   UBIFS: call dbg_is_power_cut() instead of reading c->dbg
> > ->pc_happened
> >   UBIFS: print verbose message when rescanning a corrupted node
> > 
> >  fs/ubifs/debug.c    | 8 ++++----
> >  fs/ubifs/recovery.c | 2 +-
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> Patches look good to me. :-)
> Artem, I'd queue them for v4.4, ok?

Yes, thanks,

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
