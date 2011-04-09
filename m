Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8ZCR-0006Lj-Rs
	for linux-mtd@lists.infradead.org; Sat, 09 Apr 2011 14:31:44 +0000
Received: by ewy3 with SMTP id 3so1451966ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Apr 2011 07:31:41 -0700 (PDT)
Subject: Re: [PATCH v5 0/3] Retry Large Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Erickson <marathon96@gmail.com>
In-Reply-To: <1302277894-26132-1-git-send-email-marathon96@gmail.com>
References: <1302277894-26132-1-git-send-email-marathon96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 09 Apr 2011 17:28:54 +0300
Message-ID: <1302359334.2787.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-08 at 08:51 -0700, Grant Erickson wrote:
> When handling user space read or write requests via mtd_{read,write}
> or JFFS2 medium scan requests, the operations can fail because the
> code backing these operations frequently requests large (128 KiB),
> contiguous blocks of memory using kmalloc.

Thanks, pushed the series to l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
