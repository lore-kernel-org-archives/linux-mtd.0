Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMC4B-0002RC-CZ
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 05:44:03 +0000
Received: by iaky10 with SMTP id y10so19700879iak.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 22:44:01 -0700 (PDT)
Subject: Re: [PATCH] jffs2: refactor csize in jffs2_do_read_inode_internal()
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Xi Wang <xi.wang@gmail.com>
In-Reply-To: <1335095871.2097.3.camel@golum>
Date: Mon, 23 Apr 2012 01:43:57 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <8EF5D079-1EBB-46D7-9A0A-A6054D94C958@gmail.com>
References: <1334011379-24445-1-git-send-email-xi.wang@gmail.com>
 <1335095871.2097.3.camel@golum>
To: dedekind1@gmail.com
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 22, 2012, at 7:57 AM, Artem Bityutskiy wrote:

> Please, introduce the variable in a separate patch.

Okay.

> WRT the csize check - you should compare it to something more sensible
> than INT_MAX - try to dig the code and find out what is maximum value
> JFFS2 expects. 

KMALLOC_MAX_SIZE - 1 is the smallest number I can find, since the code
calls `kmalloc(csize + 1)'.  Does that look good?

- xi
