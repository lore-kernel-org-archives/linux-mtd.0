Received: from mail10.speakeasy.net ([216.254.0.210] helo=mail.speakeasy.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jcX5-0007iB-52
	for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2003 11:25:39 +0100
From: Roger <rogerxxmaillist@speakeasy.net>
To: Selwyn Tang <selwyn@hectrix.com>
In-Reply-To: <3F2E3089.40904@hectrix.com>
References: <3F2E3089.40904@hectrix.com>
Message-Id: <1059992609.7431.19.camel@localhost3.localdomain>
Mime-Version: 1.0
Date: 04 Aug 2003 03:23:29 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: Problems with DOC 2000 on 2.4.21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-08-04 at 03:08, Selwyn Tang wrote:

> But in /dev I can't find mtd or mtd0.
> 
> Do anyone know how to resolve these problems? Thanks in advance!!
> 

I usually find after loading the mtd doc200x modules, doing:
# modprobe mtdchar

will usually produce the /dev/mtd* devices.

(correct me if i'm wrong)

-- 

Roger
http://www.eskimo.com/~roger/index.html
