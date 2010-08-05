Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OgxDi-00056l-2x
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 09:58:39 +0000
Subject: Re: [PATCH] Change struct flchip_shared spinlock locking into mutex
From: Artem Bityutskiy <dedekind1@gmail.com>
To: stefani@seibold.net
In-Reply-To: <1280992766-13745-1-git-send-email-stefani@seibold.net>
References: <1280992766-13745-1-git-send-email-stefani@seibold.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 12:37:47 +0300
Message-ID: <1281001067.15689.80.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <David.Woodhouse@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	Nicolas Pitre <nico@fluxnic.net>, Vasiliy Kulikov <segooon@gmail.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Tejun Heo <tj@kernel.org>, akpm@linux-foundation.org,
	Jiri Slaby <jslaby@suse.cz>,
	Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-08-05 at 09:19 +0200, stefani@seibold.net wrote:
> From: Stefani Seibold <stefani@seibold.net>
> 
> This patch prevent to schedule while atomic by changing the
> flchip_shared spinlock into a mutex. This should be save since no atomic
> path will use this lock.
> 
> This patch is based on linux kernel 2.6.35. Please apply.
> 
> It was suggested by Arnd Bergmann and Vasiliy Kulikov.

Pushed to my l2-mtd-2.6.git / master.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
