Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UD8VC-0005Bf-Ub
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 07:11:03 +0000
Message-ID: <1362553898.21850.3.camel@sauron>
Subject: Re: [PATCH 00/11] mtd: removals and simplifications
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 06 Mar 2013 09:11:38 +0200
In-Reply-To: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
References: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-03-05 at 15:17 +0200, Artem Bityutskiy wrote:
> This is the second version of the patch-set. This time I removed the full ID
> support provisioning part and decided to keep it separate, so this patch-set is
> basically about misc. clean-ups, code simplifications and removals of old and
> unused cruft.
> 
> The museum ID patch changed - it now removes only 256-byte NAND pages support.
> 
> Brian, I've addressed your review comments. I did not put your Acked-by to all
> of the patches, only to the one you explicitly Acked. But I can add it to all
> of the patches if you let me know.

Pushed to l2-mtd.git. If there is more review or tags coming, I can
amend the patches and re-base the tree. Thanks!

-- 
Best Regards,
Artem Bityutskiy
