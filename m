Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXWYE-0001aK-Fw
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 13:58:59 +0000
Date: Tue, 8 Apr 2014 10:57:30 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ubi: avoid workqueue format string leak
Message-ID: <20140408135729.GC2429@arch.cereza>
References: <20140408044407.GA13141@www.outflux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140408044407.GA13141@www.outflux.net>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Kees,

Thanks for the patch.

On Apr 07, Kees Cook wrote:
> When building the name for the workqueue thread, make sure a format
> string cannot leak in from the disk name.
> 

Could you enlighten me and explain why you want to avoid the name leak?
Is it a security concern?

I'd like to understad this better, so I can avoid making such mistakes
in the future.

Thanks,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
