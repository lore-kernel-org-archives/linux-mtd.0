Received: from darwin.altera.com ([66.35.227.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17sOZ4-0007gg-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2002 15:15:26 +0100
Message-Id: <200209201414.g8KEE7k04354@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Clive Davies <cdavies@altera.com>
To: Louie Boczek <louie@calimatech.com>,
   Christopher Hoover <ch@murgatroid.com>
Subject: Re: Unlocking flash problem with the epxa10db device
Date: Fri, 20 Sep 2002 15:14:07 +0100
Cc: "'ARM Linux kernel Mailinglist'" <linux-arm-kernel@lists.arm.linux.org.uk>,
   linux-mtd@lists.infradead.org
References: <000001c26061$7d20c8f0$7e00000a@bergamot> <3D8B282C.9080004@calimatech.com>
In-Reply-To: <3D8B282C.9080004@calimatech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> On a side note, is there any reason that the entire flash is unlocked on
> boot instead of just the filesystem.  I am referencing the unlock code
> in epxa10db-flash.c.
>
Not really, I didn't feel that the flash locking added much so I just 
unlocked the whole flash at boot time and forgot about it.

Clive
