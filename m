Received: from v094114.home.net.pl ([79.96.170.134])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zvtqq-0004ZK-M7
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 21:19:45 +0000
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 Russell King <linux@arm.linux.org.uk>, linux-acpi@vger.kernel.org,
 drbd-user@lists.linbit.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Oleg Drokin <oleg.drokin@intel.com>,
 Andreas Dilger <andreas.dilger@intel.com>, codalist@coda.cs.cmu.edu,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Boris Petkov <bp@suse.de>
Subject: Re: [PATCH] tree wide: Use kvfree() than conditional kfree()/vfree()
Date: Mon, 09 Nov 2015 22:48:37 +0100
Message-ID: <5253459.IxnqkcU2vL@vostro.rjw.lan>
In-Reply-To: <1447070170-8512-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
References: <1447070170-8512-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, November 09, 2015 08:56:10 PM Tetsuo Handa wrote:
> There are many locations that do
> 
>   if (memory_was_allocated_by_vmalloc)
>     vfree(ptr);
>   else
>     kfree(ptr);
> 
> but kvfree() can handle both kmalloc()ed memory and vmalloc()ed memory
> using is_vmalloc_addr(). Unless callers have special reasons, we can
> replace this branch with kvfree(). Please check and reply if you found
> problems.

ACK for the ACPI changes (and CCing Tony and Boris for the heads-up as they
are way more famailiar with the APEI code than I am).

Thanks,
Rafael
