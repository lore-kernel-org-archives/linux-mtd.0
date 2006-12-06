Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gs2SQ-0006WH-M0
	for linux-mtd@lists.infradead.org; Wed, 06 Dec 2006 14:29:33 -0500
Subject: Re: nandwrite v1.0.1 seg faults
From: Vitaly Wool <vwool@ru.mvista.com>
To: Allen Curtis <acurtis@onz.com>
In-Reply-To: <fb088a1db743546bf466829c5e7b2656@onz.com>
References: <fb088a1db743546bf466829c5e7b2656@onz.com>
Content-Type: text/plain
Date: Wed, 06 Dec 2006 22:29:30 +0300
Message-Id: <1165433370.3400.0.camel@barja>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Allen,

> I have compiled mtdutils-1.0.1 for the ARM, with the ACL patch provided 
> on this mailing list. When I run this I get a segmentation fault. 
> Version 1.0.0 of the nandwrite utility works fine.

Can you please try gdb'ing/stracing/whatever nandwrite?

Vitaly
