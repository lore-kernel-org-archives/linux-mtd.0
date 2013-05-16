Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ucue4-0006uC-R8
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 09:38:45 +0000
Message-ID: <1368697265.15764.190.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: do not abort init when ubi.mtd devices cannot be
 found
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 16 May 2013 12:41:05 +0300
In-Reply-To: <1366681216-17378-1-git-send-email-vapier@gentoo.org>
References: <1366681216-17378-1-git-send-email-vapier@gentoo.org>
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

On Mon, 2013-04-22 at 21:40 -0400, Mike Frysinger wrote:
> The current ubi.mtd parsing logic will warn & continue on when attaching
> the specified mtd device fails (for any reason).  It doesn't however skip
> things when the specified mtd device can't be opened.

Pushed to linux-ubi.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
