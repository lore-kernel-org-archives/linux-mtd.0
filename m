Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159jCu-0000QP-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 09:07:24 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <992279958.89789.mpc@mail2000.com.tw> 
References: <992279958.89789.mpc@mail2000.com.tw> 
To: mpc@mail2000.com.tw
Cc: "" <linux-mtd@lists.infradead.org>
Subject: Re: =?big5?B?UGF0Y2ggdG8gc3VwcG9ydCBUUU04eHhMIGJvYXJk?= 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Jun 2001 09:12:38 +0100
Message-ID: <2490.992333558@redhat.com>
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


Looks good generally - thanks. A few requests though...

mpc@mail2000.com.tw said:
> +dep_tristate '  CFI Flash device mapped on TQM8xxL' CONFIG_MTD_TQM8xxL $CONFIG_MTD_CFI $CONFIG_TQM8xxL 

It's normal to have config options in all capitals. I'd rather not break 
that convention. Also, we require a Configure.help entry for this option.

> + * Do not forget also choose CFI_LITTLE_ENDIAN......

Actually HOST_ENDIAN should also work, shouldn't it?

> +#ifndef CONFIG_MTD_TQM8xxL
> +#error This is for TQM8xxL platform only
> +#endif

Please omit this. It shouldn't be necessary.

> +#ifdef CONFIG_TQM8xxL 

The Config.in entry prevents us from compiling this file otherwise, so this 
should also be superfluous.

--
dwmw2
