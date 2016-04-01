Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alx8w-0007Xo-LI
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 11:21:35 +0000
Subject: Re: [PATCH 2/2] UBIFS: Implement ->migratepage()
To: Vlastimil Babka <vbabka@suse.cz>, linux-fsdevel@vger.kernel.org
References: <1459461513-31765-1-git-send-email-richard@nod.at>
 <1459461513-31765-3-git-send-email-richard@nod.at> <56FE4A1B.606@suse.cz>
Cc: linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at, david@fromorbit.com,
 dedekind1@gmail.com, alex@nextthing.co, akpm@linux-foundation.org,
 sasha.levin@oracle.com, iamjoonsoo.kim@lge.com, rvaswani@codeaurora.org,
 tony.luck@intel.com, shailendra.capricorn@gmail.com,
 kirill.shutemov@linux.intel.com, hch@infradead.org, hughd@google.com,
 mgorman@techsingularity.net
From: Richard Weinberger <richard@nod.at>
Message-ID: <56FE599F.6080400@nod.at>
Date: Fri, 1 Apr 2016 13:21:03 +0200
MIME-Version: 1.0
In-Reply-To: <56FE4A1B.606@suse.cz>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 01.04.2016 um 12:14 schrieb Vlastimil Babka:
> On 03/31/2016 11:58 PM, Richard Weinberger wrote:
>> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>>
>> During page migrations UBIFS might get confused
>> and the following assert triggers:
>> UBIFS assert failed in ubifs_set_page_dirty at 1451 (pid 436)
> 
> It would be useful to have the full trace in changelog.

Oh. Yes.

>> UBIFS is using PagePrivate() which can have different meanings across
>> filesystems. Therefore the generic page migration code cannot handle this
>> case correctly.
>> We have to implement our own migration function which basically does a
>> plain copy but also duplicates the page private flag.
>> UBIFS is not a block device filesystem and cannot use buffer_migrate_page().
>>
>> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>> [rw: Massaged changelog]
>> Signed-off-by: Richard Weinberger <richard@nod.at>
> 
> Stable?

Yep. But first I'd like to clarify if this approach is really the way to go.
It is also not clear to me whether this issue was always the case or if
a recently introduced change in MM uncovered it...
Blindly applying to all stable versions is risky.

Thanks,
//richard
