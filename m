Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JBhJ-0001UL-6X
	for <linux-mtd@lists.infradead.org>; Fri, 23 May 2003 13:30:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: guo_zhenglin <guo_zl9@hotmail.com>
In-Reply-To: <Law14-OE468xh2rmD8y0001c370@hotmail.com>
References: <Law14-OE468xh2rmD8y0001c370@hotmail.com>
Message-Id: <1053693110.3402.121.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 23 May 2003 13:31:51 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: help:  parse error before `cfi_probe_init'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-05-23 at 07:17, guo_zhenglin wrote:
> BTW, in maps/Config.in , "CONFIG_MBX860" should is "CONFIG_MBX" .

OK.

> cfi_probe.c:325: parse error before `cfi_probe_init'
> cfi_probe.c:326: warning: return-type defaults to `int'

Needs to include <linux/init.h>.

These are both now fixed in CVS. Thanks.

-- 
dwmw2
