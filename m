Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvLFy-0006T1-Pp
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 07:51:07 +0000
Message-ID: <555D8E4E.9030109@redhat.com>
Date: Thu, 21 May 2015 09:50:38 +0200
From: Denys Vlasenko <dvlasenk@redhat.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: cfi: Deiline large functions
References: <1431946720-32281-1-git-send-email-dvlasenk@redhat.com>
 <20150520185641.GI11598@ld-irv-0074>
In-Reply-To: <20150520185641.GI11598@ld-irv-0074>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Aaron Sierra <asierra@xes-inc.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/20/2015 08:56 PM, Brian Norris wrote:
> On Mon, May 18, 2015 at 12:58:40PM +0200, Denys Vlasenko wrote:
>> With this .config: http://busybox.net/~vda/kernel_config,
>> after uninlining these functions have sizes and callsite counts
>> as follows:
> 
> Most of this is probably good, thanks. But I'm curious about one:
> 
>> cfi_udelay(): 74 bytes, 26 callsites
> 
> ^^ This is pretty dead-simple. If it's generating bad code, we might
> look at fixing it up instead. Almost all of its call sites are with
> constant input, so it *should* just become:
> 
> 	udelay(1);
> 	cond_resched();
> 
> in most cases. For the non-constant cases, we might still do an
> out-of-line implementation. Or maybe we just say it's all not worth it,
> and we just stick with what you have. But I'd like to consider
> alternatives to out-lining this one.

You want to consider not-deinlining (IOW: speed-optimizing)
a *fixed time delay function*?

Think about what delay functions do...
