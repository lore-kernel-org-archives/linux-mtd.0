Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhfZg-0004uy-9K
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 12:33:52 +0000
Message-ID: <1369830989.24286.23.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] flash_erase: use pwrite() rather than lseek() && write()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 29 May 2013 15:36:29 +0300
In-Reply-To: <1367512401-14689-1-git-send-email-vapier@gentoo.org>
References: <1367512401-14689-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-05-02 at 12:33 -0400, Mike Frysinger wrote:
> Saves a syscall.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to mtd-utils.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
