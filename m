Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcucB-0006qE-1W
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 09:36:47 +0000
Message-ID: <1368697140.15764.189.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] UBI: drop redundant "UBI error" string
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 16 May 2013 12:39:00 +0300
In-Reply-To: <1367607274-30000-1-git-send-email-vapier@gentoo.org>
References: <1366680595-6197-1-git-send-email-vapier@gentoo.org>
 <1367607274-30000-1-git-send-email-vapier@gentoo.org>
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

On Fri, 2013-05-03 at 14:54 -0400, Mike Frysinger wrote:
> The ubi_err() macro automatically prefixes "UBI error" before the message.
> By also using it here, we get a log like so:
> 	UBI error: ubi_init: UBI error: cannot initialize UBI, error -19
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to linux-ubi.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
