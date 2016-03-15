Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afqxz-0007u9-7F
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2016 15:33:04 +0000
Subject: Re: Page migration issue with UBIFS
To: "Kirill A. Shutemov" <kirill@shutemov.name>
References: <56E8192B.5030008@nod.at>
 <20160315151727.GA16462@node.shutemov.name>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Gstir <david@sigma-star.at>, Dave Chinner <david@fromorbit.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Alexander Kaplan <alex@nextthing.co>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56E82B18.9040807@nod.at>
Date: Tue, 15 Mar 2016 16:32:40 +0100
MIME-Version: 1.0
In-Reply-To: <20160315151727.GA16462@node.shutemov.name>
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

Am 15.03.2016 um 16:17 schrieb Kirill A. Shutemov:
> On Tue, Mar 15, 2016 at 03:16:11PM +0100, Richard Weinberger wrote:
>> Hi!
>>
>> We're facing this issue from 2014 on UBIFS:
>> http://www.spinics.net/lists/linux-fsdevel/msg79941.html
>>
>> So sum up:
>> UBIFS does not allow pages directly marked as dirty. It want's everyone to do it via UBIFS's
>> ->wirte_end() and ->page_mkwirte() functions.
>> This assumption *seems* to be violated by CMA which migrates pages.
> 
> I don't thing the CMA/migration is the root cause.
> 
> How did we end up with writable and dirty pte, but not having
> ->page_mkwrite() called for the page?
> 
> Or if ->page_mkwrite() was called, why the page is not dirty?

BTW: UBIFS does not implement ->migratepage(), could this be a problem?

Thanks,
//richard
