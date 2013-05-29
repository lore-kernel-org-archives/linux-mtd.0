Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhfL2-0004Zl-H5
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 12:18:45 +0000
Message-ID: <1369830093.24286.19.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: document UBI_IOCVOLUP better in user header
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 29 May 2013 15:21:33 +0300
In-Reply-To: <1367466167-13087-1-git-send-email-vapier@gentoo.org>
References: <1367466167-13087-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-01 at 23:42 -0400, Mike Frysinger wrote:
> The current ioctl define implies that this func expects to be passed a
> 64bit number directly rather than a pointer to a 64bit.  The code that
> processes this ioctl shows that it clearly expects a pointer.
> 
> It'd be best if we could change the type to "__s64*", but that would
> change the generated ioctl number thus breaking the userland ABI.  So
> just add a comment for intrepid developers.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to linux-ubi.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
