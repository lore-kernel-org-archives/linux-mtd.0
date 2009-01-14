Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LN5AY-0004Q5-Bs
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 12:48:28 +0000
Subject: Re: about the _dtype_ parameter
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuanxv <xiaochuanxv@gmail.com>
In-Reply-To: <1231952548.3615.66.camel@localhost.localdomain>
References: <ff5b6bcd0901050659k4679c64egffcfa054da4c9034@mail.gmail.com>
	<1231168447.6608.26.camel@localhost.localdomain>
	<70B175DB52584932819754004995AB59@PC200810230421>
	<1231839695.5973.15.camel@localhost.localdomain>
	<1231952548.3615.66.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Jan 2009 14:48:39 +0200
Message-Id: <1231937319.5973.67.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-01-15 at 01:02 +0800, xiaochuanxv wrote:
> Sorry, a mistake in writing: 
> 
> (Suppose wr-ratio represent the ratio of erasures due to wear-leveling
> to erasure total physical erase-block erasures. )
> I found that when most of the @dtype is equal to UBI_SHORTTERM, the
> wr-ratio is approximately equal to 0.1%, whereas is greater than
>  
> 0.4% 
> 
> when @dtype is always UBI_UNKNOWN. It seem that the data type call-back
> policy does NOT make any sense in the current implementation.

Hmm, interesting observation. I would suggest you to add statistics
support to UBI. Introduce a counter for the amount of times UBI moves
PEB data, and expose it via sysfs. You may probably add other counters
like number of erasures and so on.

Then it will be easier to do testing and investigations.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
