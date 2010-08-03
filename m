Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgCoy-00062w-Ll
	for linux-mtd@lists.infradead.org; Tue, 03 Aug 2010 08:26:01 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: stefani@seibold.net
Subject: Re: [PATCH] Change struct flchip_shared spinlock locking into mutex
Date: Tue, 3 Aug 2010 10:25:52 +0200
References: <1280778048-6208-1-git-send-email-stefani@seibold.net>
In-Reply-To: <1280778048-6208-1-git-send-email-stefani@seibold.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201008031025.52409.arnd@arndb.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Nicolas Pitre <nico@fluxnic.net>, Vasiliy Kulikov <segooon@gmail.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Tejun Heo <tj@kernel.org>, akpm@linux-foundation.org,
	Jiri Slaby <jslaby@suse.cz>,
	Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 02 August 2010, stefani@seibold.net wrote:
> From: Stefani Seibold <stefani@seibold.net>
> 
> This patch prevent to schedule while atomic by changing the
> flchip_shared spinlock into a mutex. This should be save since no atomic
> path will use this lock.

I don't know this code well, but the patch looks correct and seems
to be needed.

Acked-by: Arnd Bergmann <arnd@arndb.de>
