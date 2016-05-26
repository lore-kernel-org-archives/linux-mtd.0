Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5wMH-0002kh-Tt
 for linux-mtd@lists.infradead.org; Thu, 26 May 2016 14:33:58 +0000
Subject: Re: [PATCH V2] fs: ubifs: Replace kmem_cache_alloc/memset with
 kmem_cache_zalloc
To: Salah Triki <salah.triki@acm.org>, dedekind1@gmail.com,
 adrian.hunter@intel.com
References: <1464272937-6629-1-git-send-email-salah.triki@acm.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5747093D.50508@nod.at>
Date: Thu, 26 May 2016 16:33:33 +0200
MIME-Version: 1.0
In-Reply-To: <1464272937-6629-1-git-send-email-salah.triki@acm.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 26.05.2016 um 16:28 schrieb Salah Triki:
> Code is more readable when using kmem_cache_zalloc instead of kmem_cache_alloc/memset.

I don't fully agree. You also have ignored my other comment on this patch.
Please note that the path you are patching is a hot path.

Thanks,
//richard
