Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQwDb-00073h-2e
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 10:30:44 +0000
Message-ID: <1410172218.10764.136.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] nandtest: fix --reads argument
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Guido =?ISO-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Mon, 08 Sep 2014 13:30:18 +0300
In-Reply-To: <1408033785-20264-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1408033785-20264-1-git-send-email-guido@vanguardiasur.com.ar>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Ezequiel =?ISO-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-08-14 at 13:29 -0300, Guido Martínez wrote:
> The --reads option specifies the argument as optional, but doesn't check
> for a null optarg, which means that nandtest segfaults when run as
> "nandtest --reads".
> 
> Fix this by making the argument required, and changing the help text to
> not specify it as optional. Argument -r already specifies the argument
> as required, so we fix this inconsistency too.
> 
> Signed-off-by: Guido Martínez <guido@vanguardiasur.com.ar>

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy
