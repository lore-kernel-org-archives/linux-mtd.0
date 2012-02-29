Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S2m3l-0001Jk-DN
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 16:07:22 +0000
Received: from [192.168.12.102] (248.sub-166-250-10.myvzw.com [166.250.10.248])
 by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id q1TG7F1Z094929
 (version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Wed, 29 Feb 2012 08:07:16 -0800 (PST)
 (envelope-from mikedunn@newsguy.com)
Message-ID: <4F4E4D1B.4000903@newsguy.com>
Date: Wed, 29 Feb 2012 08:06:51 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Problems with mtd_oobtest
References: <CAHMF36Gy9r2mPRrahpbAMvwOE=jWD3jzWqpF4846gG6saHjZ-w@mail.gmail.com>
In-Reply-To: <CAHMF36Gy9r2mPRrahpbAMvwOE=jWD3jzWqpF4846gG6saHjZ-w@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/27/2012 11:02 PM, Matej Kupljen wrote:

> I can run mtd_speedtest, mtd_stresstest, mtd_readtest, mtd_pagetest without the
> problems, but when I start the mtd_oobtest it fails, basically on every page!


Your flash device probably does not support writing oob-only.  This is true of
some NAND devices.  I wouldn't worry about this test.  This failure is probably
unrelated to your ubifs problems.


> I can use JFFS2 on this device, and for some time even UBIFS, but then
> it just fails.


What is the nature of the ubifs failure?  The kernel log should tell you.  It
may be the same problem I experience, where over time too many erase bocks are
marked as bad.  This is due to the unforgiving nature of ubi wrt corrected
bitflips, and tends to be a problem on NAND flash devices with high bit errors,
for which the device compensates with strong ecc.  I'm working on some patches
that should fix this.

Mike
