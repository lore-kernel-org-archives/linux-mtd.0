Received: from postman.amit.cz ([188.95.124.147])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ehBly-00060m-02
 for linux-mtd@lists.infradead.org; Thu, 01 Feb 2018 10:07:20 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by postman.amit.cz (Postfix) with ESMTP id CF4A2963B
 for <linux-mtd@lists.infradead.org>; Thu,  1 Feb 2018 10:58:03 +0100 (CET)
Received: from postman.amit.cz ([127.0.0.1])
 by localhost (imp.amit.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGXvf9b6-xqn for <linux-mtd@lists.infradead.org>;
 Thu,  1 Feb 2018 10:57:57 +0100 (CET)
Date: Thu, 1 Feb 2018 10:57:57 +0100
From: Ondrej Bilka <bilka@amit.cz>
To: linux-mtd@lists.infradead.org
Subject: Adding cfi type driver from userspace of old(2.6.18) kernel.
Message-ID: <20180201095757.GB27675@postman.amit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Is there easy way after adding cfi_cmdset_0002 via insmod
in init script to probe devices again? Or turn device off and on?

Other option would be pointers how to debug why module 
isn't loaded despite being in /etc/modules. Or if some udev rule
would work?

We have several 2.6.18 binary kernels that contain logic for
UART/serial communication. We have sources only for some 
versions as that logic got overwritten without version contol.

Where we have sources we could directly add cfi type support 
without problem. But we don't know if it's possible to add support
of rest with a module.

Thanks.
