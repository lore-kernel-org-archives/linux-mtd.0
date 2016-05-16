Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2IC5-0002vJ-Ix
 for linux-mtd@lists.infradead.org; Mon, 16 May 2016 13:04:22 +0000
Subject: Re: UBIFS and page migration (take 3)
To: Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>
References: <1462974823-3168-1-git-send-email-richard@nod.at>
 <20160512114948.GA25113@infradead.org> <5739C0C1.1090907@nod.at>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 boris.brezillon@free-electrons.com, maxime.ripard@free-electrons.com,
 david@sigma-star.at, david@fromorbit.com, dedekind1@gmail.com,
 alex@nextthing.co, akpm@linux-foundation.org, sasha.levin@oracle.com,
 iamjoonsoo.kim@lge.com, rvaswani@codeaurora.org, tony.luck@intel.com,
 shailendra.capricorn@gmail.com, kirill.shutemov@linux.intel.com,
 hughd@google.com, mgorman@techsingularity.net
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <5739C53B.1010700@suse.cz>
Date: Mon, 16 May 2016 15:03:55 +0200
MIME-Version: 1.0
In-Reply-To: <5739C0C1.1090907@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/16/2016 02:44 PM, Richard Weinberger wrote:
> MM folks, do we have a way to force page migration?

On NUMA we have migrate_pages(2).

> Maybe we can create a generic stress test.
>
> Thanks,
> //richard
>
> --
> To unsubscribe, send a message with 'unsubscribe linux-mm' in
> the body to majordomo@kvack.org.  For more info on Linux MM,
> see: http://www.linux-mm.org/ .
> Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
>
