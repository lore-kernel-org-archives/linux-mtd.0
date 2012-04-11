Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SHmoy-0001ut-3q
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2012 01:58:08 +0000
Message-ID: <4F84E5F6.7050805@freescale.com>
Date: Wed, 11 Apr 2012 10:01:26 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Florian Fainelli <ffainelli@freebox.fr>
Subject: Re: [PATCH] mtd : print out the page size and oob size after parsing
 out the nand
References: <1333942897-7392-1-git-send-email-b32955@freescale.com>
 <4F840B56.403@freebox.fr>
In-Reply-To: <4F840B56.403@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> Relying on the kernel to print something to assert the correctness of 
> the NAND detection is really weak, you'd better query these properties 
> in userland. Also, I am afraid everyone adds a new NAND property 
> print-out.
thanks.

If no one like this patch, just ignore it.

Huang Shijie
