Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNSBh-0005Az-ME
 for linux-mtd@lists.infradead.org; Wed, 13 Jul 2016 21:59:57 +0000
Subject: Re: [PATCH 1/8] mtd-utils: Fix return status in mtd_torture test
 function
To: Brian Norris <computersforpeace@gmail.com>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-2-git-send-email-richard@nod.at>
 <20160713173024.GA10487@google.com>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at,
 Boris Brezillon <boris.brezillon@free-electrons.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5786B9A4.4090609@nod.at>
Date: Wed, 13 Jul 2016 23:59:00 +0200
MIME-Version: 1.0
In-Reply-To: <20160713173024.GA10487@google.com>
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

Brian,

Am 13.07.2016 um 19:30 schrieb Brian Norris:
> On Tue, Apr 26, 2016 at 12:13:22AM +0200, Richard Weinberger wrote:
>> From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>>
>> This patch fixes the return status of the mtd_torture function
>> in libmtd.
>>
>> The torture test function is currently only used by the ubiformat
>> utilitiy to check if a block is bad after a write fails (blocks are
>> marked bad if the function returns an error status). However, the
>> way the function was written, it ALWAYS returns an error value
>> irregardless of whether it failed or not.
>>
>> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
> 
> Seems like everyone's reviewed this, but no one applied it. (Richard,
> did we get you push access to mtd-utils yet?)

I think I have write access.

But I'm still a bit unsure how the mtd-utils release cycle
works.
In fact, I fear there is none. ;-)

David was so kind and went through linux-mtd@ to located old but not merged
mtd-utils packages.
I'm currently rebasing them to 1.5.2 and would push them later into a temporary
branch.

Thanks,
//richard
