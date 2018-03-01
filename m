Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erR10-0002dJ-LN
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2018 16:25:08 +0000
From: Richard Weinberger <richard@nod.at>
To: Liu Song <liu.song11@zte.com.cn>
Cc: dedekind1@gmail.com, adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, jiang.biao2@zte.com.cn, zhong.weidong@zte.com.cn
Subject: Re: [PATCH] fs/UBIFS: make 'sum' definition closer to where it is used
Date: Thu, 01 Mar 2018 17:26:19 +0100
Message-ID: <49033492.RPiX3hNQUc@blindfold>
In-Reply-To: <1519785723-105686-1-git-send-email-liu.song11@zte.com.cn>
References: <1519785723-105686-1-git-send-email-liu.song11@zte.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, 28. Februar 2018, 03:42:03 CET schrieb Liu Song:
> Local var sum is only used in one branch, and it may be not used if
> it is defined outside the branch. Try to move the definition into
> the branch to make it closer to where it is actually used.

Does this fix a problem?
I'm not a huge fan of defining variables in the middle of functions unless it 
makes the code really better.

Thanks,
//richard
