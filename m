Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16OnRp-0006Xb-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jan 2002 22:13:21 +0000
Received: from mvista.com (IDENT:ahennessy@penelope.mvista.com [10.0.0.122])
	by hermes.mvista.com (8.11.0/8.11.0) with ESMTP id g0AMNHB12346
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jan 2002 14:23:17 -0800
Message-ID: <3C3E1515.CD99EB0@mvista.com>
Date: Thu, 10 Jan 2002 14:26:29 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Problem with cfi_probe.c and Intel chip
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

I just tried the latest code  and discovered that the command used
before the query command  and also to
return to read mode  in cfi_probe.c  has been changed to 0xF0 - it used
to be 0xFF .  The board I'm testing
on has an Intel strata chip and is not responding to the query.  If I
use 0xFF, then everything is fine.  AMD chips
seems to be happy with either command (I think because the
AMD automatically returns to read mode after
a command anyway).   It looks like this was changed with the jedec-probe

additions so maybe this is necessary
for older jedec chips (which I haven't tested).

Alice
