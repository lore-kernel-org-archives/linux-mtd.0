Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7OH2-0004Lp-6c
	for linux-mtd@lists.infradead.org; Sun, 17 Oct 2010 08:07:20 +0000
Received: by bwz7 with SMTP id 7so2808205bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Oct 2010 01:07:19 -0700 (PDT)
Subject: Re: [PATCH] mtd-utils: flash_erase: Fix output of offsets
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1287262445-19654-1-git-send-email-computersforpeace@gmail.com>
References: <1287262445-19654-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 17 Oct 2010 11:04:15 +0300
Message-ID: <1287302655.1951.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-10-16 at 13:54 -0700, Brian Norris wrote:
> Need to use unsigned arithmetic and a 64-bit cast in order to
> calculate and output the correct offset for eraseblocks at large
> offsets. Signed integer arithmetic does not produce the correct
> result "uint64_t" result, so for offsets over 2GB we get
> messages like:
> 
> 	Erasing 512 Kibyte @ ffffffff83180000 -- 4308642136 % complete.
> 
> Note that this error was not affecting proper erasure; it just
> produced incorrect status messages.
> 
> Also, we should not add an extra eraseblock for the final status
> message; this gives misleading output when, for example, the
> following statement is executed:
> 
> 	$ flash_erase /dev/mtd0 0 1
> 	Erasing 512 Kibyte @ 80000 -- 100 % complete
> 
> We aren't erasing at offset 0x80000; it should display offset 0.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
