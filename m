Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgsX1-0003fo-Sf
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 04:58:16 +0000
Received: by fxm3 with SMTP id 3so3249384fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Aug 2010 21:58:14 -0700 (PDT)
Subject: Re: [PATCH] Change struct flchip_shared spinlock locking into mutex
From: Artem Bityutskiy <dedekind1@gmail.com>
To: stefani@seibold.net
In-Reply-To: <1280778048-6208-1-git-send-email-stefani@seibold.net>
References: <1280778048-6208-1-git-send-email-stefani@seibold.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 07:58:11 +0300
Message-Id: <1280984291.1175.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>,
	Vasiliy Kulikov <segooon@gmail.com>,
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

On Mon, 2010-08-02 at 21:40 +0200, stefani@seibold.net wrote:
> From: Stefani Seibold <stefani@seibold.net>
> 
> This patch prevent to schedule while atomic by changing the
> flchip_shared spinlock into a mutex. This should be save since no atomic
> path will use this lock.
> 
> This patch is based on linux kernel 2.6.35. Please apply.
> 
> It was requested by Arnd Bergmann and Vasiliy Kulikov.

Taken to my l2-mtd-2.6.git / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
