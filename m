Received: from ug-out-1314.google.com ([66.249.92.175])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HRq24-0007ln-9J
	for linux-mtd@lists.infradead.org; Thu, 15 Mar 2007 13:30:18 +0000
Received: by ug-out-1314.google.com with SMTP id m2so298977uge
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Mar 2007 06:20:07 -0700 (PDT)
Message-ID: <625fc13d0703150610w28dbd4bdq4147a12087f0edbf@mail.gmail.com>
Date: Thu, 15 Mar 2007 08:10:06 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: haver@vnet.ibm.com
Subject: Re: [PATCH] [MTD] MTD-Utils: fix handling of ioctl return value in
	nand-utils
In-Reply-To: <1173878228.4048.2.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1173878228.4048.2.camel@localhost.localdomain>
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/14/07, Frank Haverkamp <haver@vnet.ibm.com> wrote:
> Older kernel do not implement the MTDFILEMODE ioctl. In this case
> nandwrite and nanddump should have used MEMGETOOBSEL in combination
> with MEMSETOOBSEL. Unfortunately the return value of the unsucessfull
> ioctl is not -ENOTTY, but -1 and errno contains ENOTTY. This change
> fixes this issue. I have not tested all cornercases. Would be
> good if someone could do more careful testing than I did, or maybe
> reviewing is sufficient in this case.

This looks good.  Applied.  Thank you.

josh
