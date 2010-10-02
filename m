Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P22mj-0003fC-Tp
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2010 14:09:58 +0000
Received: by bwz19 with SMTP id 19so3764003bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 02 Oct 2010 07:09:57 -0700 (PDT)
Subject: Re: [patch 1/2] mtdpart: memory accessor interface for MTD layer
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <201010012116.o91LGRGn021118@imap1.linux-foundation.org>
References: <201010012116.o91LGRGn021118@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 02 Oct 2010 17:09:52 +0300
Message-ID: <1286028592.32172.14.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sudhakar.raj@ti.com, khilman@deeprootsystems.com, david-b@pacbell.net,
	linux-mtd@lists.infradead.org, cbouatmailru@gmail.com, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-10-01 at 14:16 -0700, akpm@linux-foundation.org wrote:
> From: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> 
> Implement a memory accessor interface in the MTD layer which enables the
> kernel to access flash data.
> 
> This patch adds two new members to the mtd_partition structure, a function
> handler which will be called during setup of the partition and an argument
> to be passed to this setup function.

This patch does not apply to my l2-mtd-2.6.git tree - many confilicts.
Sudhakar, you can refresh your patch against my tree and re-send:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
