Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrN5I-0006Mc-E9
 for linux-mtd@lists.infradead.org; Mon, 02 Jun 2014 07:55:09 +0000
Message-ID: <1401695682.11182.108.camel@sauron.fi.intel.com>
Subject: Re: [RFC 17/32] ubifs: convert to struct inode_time
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 02 Jun 2014 10:54:42 +0300
In-Reply-To: <1401480116-1973111-18-git-send-email-arnd@arndb.de>
References: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
 <1401480116-1973111-18-git-send-email-arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-arch@vger.kernel.org, hpa@zytor.com, linux-kernel@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, hch@infradead.org,
 john.stultz@linaro.org, linux-mtd@lists.infradead.org, lftan@altera.com,
 linux-fsdevel@vger.kernel.org, geert@linux-m68k.org, tglx@linutronix.de,
 joseph@codesourcery.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-05-30 at 22:01 +0200, Arnd Bergmann wrote:
> ubifs uses 64-bit integers for inode timestamps, which will work
> practicall forever, but the VFS uses struct timespec for timestamps,
> which is only good until 2038 on 32-bit CPUs.
> 
> This gets us one small step closer to lifting the VFS limit by using
> struct inode_time in ubifs.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Cc: linux-mtd@lists.infradead.org

Looks fine from UBIFS POW, thanks!

-- 
Best Regards,
Artem Bityutskiy
