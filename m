Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFqWk-0001M4-Au
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 22:21:43 +0000
Subject: Re: [PATCH 1/3] mm: Don't blindly assign fallback_migrate_page()
To: Andrew Morton <akpm@linux-foundation.org>
References: <1466112375-1717-1-git-send-email-richard@nod.at>
 <1466112375-1717-2-git-send-email-richard@nod.at>
 <20160616161121.35ee5183b9ef9f7b7dcbc815@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, hannes@cmpxchg.org,
 mgorman@techsingularity.net, n-horiguchi@ah.jp.nec.com, mhocko@suse.com,
 kirill.shutemov@linux.intel.com, hughd@google.com, vbabka@suse.cz,
 adrian.hunter@intel.com, dedekind1@gmail.com, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at, david@fromorbit.com,
 alex@nextthing.co, sasha.levin@oracle.com, iamjoonsoo.kim@lge.com,
 rvaswani@codeaurora.org, tony.luck@intel.com, shailendra.capricorn@gmail.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <576B0F57.3030700@nod.at>
Date: Thu, 23 Jun 2016 00:21:11 +0200
MIME-Version: 1.0
In-Reply-To: <20160616161121.35ee5183b9ef9f7b7dcbc815@linux-foundation.org>
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

Am 17.06.2016 um 01:11 schrieb Andrew Morton:
> On Thu, 16 Jun 2016 23:26:13 +0200 Richard Weinberger <richard@nod.at> wrote:
> 
>> While block oriented filesystems use buffer_migrate_page()
>> as page migration function other filesystems which don't
>> implement ->migratepage() will automatically get fallback_migrate_page()
>> assigned. fallback_migrate_page() is not as generic as is should
>> be. Page migration is filesystem specific and a one-fits-all function
>> is hard to achieve. UBIFS leaned this lection the hard way.
>> It uses various page flags and fallback_migrate_page() does not
>> handle these flags as UBIFS expected.
>>
>> To make sure that no further filesystem will get confused by
>> fallback_migrate_page() disable the automatic assignment and
>> allow filesystems to use this function explicitly if it is
>> really suitable.
> 
> hm, is there really much point in doing this?  I assume it doesn't
> actually affect any current filesystems?
> 
> [2/3] is of course OK - please add it to the UBIFS tree.

Pushed 2/3 and 3/3 into UBIFS next tree.

Thanks,
//richard
