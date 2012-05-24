Received: from arrakis.dune.hu ([78.24.191.176])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SXTku-0007aJ-F3
 for linux-mtd@lists.infradead.org; Thu, 24 May 2012 08:50:49 +0000
Message-ID: <4FBDF65D.8010205@openwrt.org>
Date: Thu, 24 May 2012 10:50:37 +0200
From: Gabor Juhos <juhosg@openwrt.org>
MIME-Version: 1.0
To: artem.bityutskiy@linux.intel.com
Subject: Re: [PATCH] mtd: block2mtd: fix recursive call of mtd_writev
References: <1337811443-2603-1-git-send-email-juhosg@openwrt.org>
 <1337845719.15137.71.camel@sauron.fi.intel.com>
In-Reply-To: <1337845719.15137.71.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012.05.24. 9:48 keltezéssel, Artem Bityutskiy írta:
> On Thu, 2012-05-24 at 00:17 +0200, Gabor Juhos wrote:
>> The 'mtd_writev' interface calls the function assigned to the '_write'
>> field of a given mtd device if that is not NULL. The block2mtd driver
>> sets the '_writev' field to the 'mtd_writev' function itself and thus
>> causes a endless loop.
>> 
>> This is caused by 1dbebd32562b3c2caeca35960e5cb00bfcc12900 (mtd:
>> harmonize mtd_writev usage).
>> 
>> Remove the assignment from the block2mtd driver to fix the issue.
>> 
>> Signed-off-by: Gabor Juhos <juhosg@openwrt.org> Cc: Artem Bityutskiy
>> <artem.bityutskiy@linux.intel.com> Cc: stable@vger.kernel.org
> 
> Amended the "stable" tag and pushed to l2-mtd.git, thanks:
> 
> Cc: stable@kernel.org [3.3+]
> 

Thanks!
