Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19weaQ-0006Zu-2P
	for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2003 10:14:58 +0100
Mime-Version: 1.0
Message-Id: <a05200f3ebb8347166dbf@[130.161.115.44]>
In-Reply-To: <200309091012.22241.luca.contini@mediaenabling.com>
References: <200309091012.22241.luca.contini@mediaenabling.com>
Date: Tue, 9 Sep 2003 11:14:01 +0200
To: Luca Contini <luca.contini@mediaenabling.com>
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
cc: MTD-Linux <linux-mtd@lists.infradead.org>
Subject: Re: missing function 'unlikely'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At 10:12 +0200 09-09-2003, Luca Contini wrote:
>Hi all,
>I've downloaded the snapshot 2003-08-28 and I'm trying to use it with kernel
>2.4.18.
>The mtdblock module is compiled with no problems but when i try to insert it I
>get this error:
>'unresolved symbol unlikely'
>I've done a grep on the entire kernel tree but with no result.

Which version of gcc are you using ?

unlikely() is an optimization hint to the compiler, telling it that 
the conditional statement in question is expected to be false.

As a hack, you can disable it by including

#define unlikely(x) (x)

in the affected source files. I would suggest upgrading your tools, though.

HTH,

JDB.
-- 
LART. 250 MIPS under one Watt. Free hardware design files.
http://www.lart.tudelft.nl/
