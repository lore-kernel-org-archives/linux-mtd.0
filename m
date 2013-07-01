Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtXNO-0000DE-6o
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 06:14:14 +0000
Message-ID: <1372659484.22014.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH mtd-utils 1/4 v2] nand{dump, test, write}: clean up
 --help handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 01 Jul 2013 09:18:04 +0300
In-Reply-To: <1368122364-9754-1-git-send-email-vapier@gentoo.org>
References: <1368122364-9754-1-git-send-email-vapier@gentoo.org>
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

On Thu, 2013-05-09 at 13:59 -0400, Mike Frysinger wrote:
> We should send the output to stdout when the user passes -h/--help
> and then exit(0), but otherwise the output should go to stderr and
> then exit(1).
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v2

Ok, I've committed a delta between v2 and v1 as well. And then also
pushed the "[PATCH mtd-utils 4/4 v2] ubiupdatevol: add a --skip option"
patch. So everything should be there.

-- 
Best Regards,
Artem Bityutskiy
