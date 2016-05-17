Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2dA1-0006HR-Nm
 for linux-mtd@lists.infradead.org; Tue, 17 May 2016 11:27:39 +0000
Subject: Re: UBIFS and page migration (take 3)
To: Vlastimil Babka <vbabka@suse.cz>, Christoph Hellwig <hch@infradead.org>
References: <1462974823-3168-1-git-send-email-richard@nod.at>
 <20160512114948.GA25113@infradead.org> <5739C0C1.1090907@nod.at>
 <5739C53B.1010700@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 boris.brezillon@free-electrons.com, maxime.ripard@free-electrons.com,
 david@sigma-star.at, david@fromorbit.com, dedekind1@gmail.com,
 alex@nextthing.co, akpm@linux-foundation.org, sasha.levin@oracle.com,
 iamjoonsoo.kim@lge.com, rvaswani@codeaurora.org, tony.luck@intel.com,
 shailendra.capricorn@gmail.com, kirill.shutemov@linux.intel.com,
 hughd@google.com, mgorman@techsingularity.net
From: Richard Weinberger <richard@nod.at>
Message-ID: <573B0009.3070004@nod.at>
Date: Tue, 17 May 2016 13:27:05 +0200
MIME-Version: 1.0
In-Reply-To: <5739C53B.1010700@suse.cz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vlastimil,

Am 16.05.2016 um 15:03 schrieb Vlastimil Babka:
> On 05/16/2016 02:44 PM, Richard Weinberger wrote:
>> MM folks, do we have a way to force page migration?
> 
> On NUMA we have migrate_pages(2).

Doesn't this only migrate process (user) pages?
AFAIK we need a way to force migration of pages which
are in the page cache.

*confused*,
//richard
