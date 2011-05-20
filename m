Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNIps-0003z3-1v
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 06:05:23 +0000
Received: by eyh6 with SMTP id 6so1286929eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2011 23:05:17 -0700 (PDT)
Subject: Re: mtd: fix hang-up in cfi erase and read contention
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tadashi Abe <tabe@mvista.com>
In-Reply-To: <4DD4BF87.6030107@mvista.com>
References: <4DD4BF87.6030107@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 09:01:27 +0300
Message-ID: <1305871287.2630.98.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-19 at 15:58 +0900, Tadashi Abe wrote:
> cfi erase command hangs up when erase and read contention occurs.
> If read runs at the same address as erase operation, read issues
> Erase-Suspend via get_chip() and the erase goes into sleep in wait queue.
> But in this case, read operation exits by time-out without waking it up.
> 
> I think the other variants (0001, 0020 and lpddr) have the same problem too.
> Tested and verified the patch only on CFI-0002 flash, though.
> 
> Signed-off-by: Tadashi Abe <tabe@mvista.com>

Pushed both cfi patches to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
