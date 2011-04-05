Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q77SM-0005Oe-SX
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 14:42:11 +0000
Received: by ewy3 with SMTP id 3so143257ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Apr 2011 07:42:08 -0700 (PDT)
Subject: Re: [PATCHv2] tests: jittertest: fix set of compiler warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
In-Reply-To: <7c7a314f7d09b032f4cff10070853ad360588f30.1302013906.git.ext-andriy.shevchenko@nokia.com>
References: <1302013204.2760.135.camel@localhost>
	<7c7a314f7d09b032f4cff10070853ad360588f30.1302013906.git.ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 17:39:26 +0300
Message-ID: <1302014366.2760.143.camel@localhost>
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

On Tue, 2011-04-05 at 17:32 +0300, Andy Shevchenko wrote:
> -            read(Fd2, tmpBuf, 1);
> +	    cntr = read(Fd2, tmpBuf, 1);
> +	    if (cntr < 0)
> +		perror("read error");

I've pushed this but only then noticed that you should have checked
(cntr != 1) instead. But this is not a big deal anyway.
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
