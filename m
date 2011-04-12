Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9Yxk-0005xL-5b
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 08:28:40 +0000
Received: by fxm14 with SMTP id 14so5445538fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Apr 2011 01:28:38 -0700 (PDT)
Subject: Re: [PATCH] Fix gcc-4.5.2 "statement with no effect" warnings in UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: maksim.rayskiy@gmail.com
In-Reply-To: <1302558659-29472-1-git-send-email-maksim.rayskiy@gmail.com>
References: <1302558659-29472-1-git-send-email-maksim.rayskiy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Apr 2011 11:25:44 +0300
Message-ID: <1302596744.2739.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-11 at 14:50 -0700, maksim.rayskiy@gmail.com wrote:
> From: Maksim Rayskiy <maksim.rayskiy@gmail.com>
> 
> When compiling UBIFS with CONFIG_UBIFS_FS_DEBUG not set,
> gcc-4.5.2 generates a slew of "warning: statement with no effect"
> on references to non-void functions defined as 0.
> To avoid these warnings, change appropriate definitions from
>  #define dbg_xxx(a)	0
> to
>  #define dbg_xxx(a)	({0; })

Hi, thanks for the fix, but I agree that something like

static inline int dbg_xxx(a) { return 0; }

would be cleaner. Would you mind trying that approach and sending a
patch?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
