Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtXAN-0008P9-PX
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 06:00:48 +0000
Message-ID: <1372658663.22014.10.camel@sauron.fi.intel.com>
Subject: Re: [PATCH [mtd-utils] 1/3] nand{dump, test, write}: clean up
 --help handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 01 Jul 2013 09:04:23 +0300
In-Reply-To: <1368054125-32214-1-git-send-email-vapier@gentoo.org>
References: <1368054125-32214-1-git-send-email-vapier@gentoo.org>
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

On Wed, 2013-05-08 at 19:02 -0400, Mike Frysinger wrote:
> We should send the output to stdout when the user passes -h/--help
> and then exit(0), but otherwise the output should go to stderr and
> then exit(1).
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed all 3 to mtd-utils.git, thanks!

I guess it is time to make an mtd-utils release...

-- 
Best Regards,
Artem Bityutskiy
