Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKmIF-0006FK-54
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 10:09:47 +0000
Message-ID: <1393927755.3412.202.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v7 2/3] ubi-utils: Add ubiblock tool
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 04 Mar 2014 12:09:15 +0200
In-Reply-To: <1393245564-23947-3-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393245564-23947-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1393245564-23947-3-git-send-email-ezequiel.garcia@free-electrons.com>
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

Would it please be possible to use 'create' and 'remove' instead of
'attach' and 'detach'. I believe the whole thing will be less confusing
then, because these terms are already used for UBI<->MTD relations.

Also, would you please contribute this tool under GPLv2 license, rather
than GPL 2 or any later version. Because all the other UBI tools are
like this, it will make things simpler.

-- 
Best Regards,
Artem Bityutskiy
