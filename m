Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKfiD-0001lK-0J
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 06:54:04 +0000
Subject: Re: [PATCH] ubifs: Change gfp flags in page allocation for bulk read
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel-team@lge.com
References: <1497335447-4937-1-git-send-email-hyc.lee@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <314951c9-6a6e-7f7c-5f3e-45827778f81f@nod.at>
Date: Tue, 13 Jun 2017 08:53:19 +0200
MIME-Version: 1.0
In-Reply-To: <1497335447-4937-1-git-send-email-hyc.lee@gmail.com>
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

Hyunchul,

Am 13.06.2017 um 08:30 schrieb Hyunchul Lee:
> From: Hyunchul Lee <cheol.lee@lge.com>
> 
> Use readahead_gfp_mask for gfp flags when allocating pages.
> This set additional flags which are __GFP_NORETRY and
> __GFP_NOWARN. So OOMs and a failure message can be
> avoided.
> And we should remove __GFP_FS from flags to prevent from
> calling ubifs_writepage during page reclaim.

Your commit message does not explain why we need this and what
problem it solves.
When facing changes like this I'm especially interested in whether
this is a theoretical bugfix or not.

Thanks,
//richard
