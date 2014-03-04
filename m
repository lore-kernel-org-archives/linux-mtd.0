Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKmQ7-0001PB-CV
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 10:17:56 +0000
Date: Tue, 4 Mar 2014 07:16:58 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v7 2/3] ubi-utils: Add ubiblock tool
Message-ID: <20140304101657.GA28411@localhost>
References: <1393245564-23947-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1393245564-23947-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <1393927755.3412.202.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1393927755.3412.202.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 04, 2014 at 12:09:15PM +0200, Artem Bityutskiy wrote:
> Would it please be possible to use 'create' and 'remove' instead of
> 'attach' and 'detach'. I believe the whole thing will be less confusing
> then, because these terms are already used for UBI<->MTD relations.
> 

Sure, if you feel it's less confusing this way I have no problem.

> Also, would you please contribute this tool under GPLv2 license, rather
> than GPL 2 or any later version. Because all the other UBI tools are
> like this, it will make things simpler.
> 

Sure, no problem.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
