Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Y8ik-0000ZH-00
	for mtd-list@infradead.org; Wed, 28 Feb 2001 15:40:54 +0000
Received: from [209.226.59.34] (helo=hemlock.payanybill.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Y8id-0000ZB-00
	for mtd@infradead.org; Wed, 28 Feb 2001 15:40:53 +0000
Received: from linkata.com ([192.168.1.164]) by
          hemlock.payanybill.com (Netscape Messaging Server 4.15) with
          ESMTP id G9H4SK00.07G for <mtd@infradead.org>; Wed, 28 Feb 2001
          10:38:44 -0500
Message-ID: <3A9D1BE3.EDDBC670@linkata.com>
Date: Wed, 28 Feb 2001 10:40:20 -0500
From: Tim Bloomfield <tim_bloomfield@linkata.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Unable to install modules: initcalls
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I have compiled the mtd patch on kernel 2.2.17, with the mtd components
as modules. It appears that I must install the module initcalls before I
can install mtdcore.  When I try and install initcalls I get the error:
"couldn't find the kernel version the module was compiled for".

I suspect that there should not be an initcalls module. I have installed
the inter-module patch for 2.2.17. What am I missing. Thanks,

-Tim





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
