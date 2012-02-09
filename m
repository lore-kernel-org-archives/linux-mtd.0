Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvNvN-0003Dp-Ib
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2012 06:56:10 +0000
Received: by wera10 with SMTP id a10so1116829wer.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 22:56:05 -0800 (PST)
Date: Thu, 9 Feb 2012 08:55:56 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC] MTD API rework: Harmonize initialization of
 erase_info->fail_addr
Message-ID: <20120209085556.0f494f05@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Prior MTD API rework, 'mtd->erase()' users needed to initialize
'erase_info->fail_addr' to MTD_FAIL_ADDR_UNKNOWN.
Sometimes it was taken care of by the mtd driver's 'erase'
implementation.

Harmonize this, by initializing 'fail_addr' within the new 'mtd_erase'
interface.

If idea is suitable, can work on a patch (although not immediately).

Regards,
Shmulik
