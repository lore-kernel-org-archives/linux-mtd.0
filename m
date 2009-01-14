Received: from ti-out-0910.google.com ([209.85.142.185])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LN1eB-0001I8-7E
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 09:03:00 +0000
Received: by ti-out-0910.google.com with SMTP id a21so323107tia.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jan 2009 01:02:44 -0800 (PST)
Subject: Re: about the _dtype_ parameter
From: xiaochuanxv <xiaochuanxv@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1231839695.5973.15.camel@localhost.localdomain>
References: <ff5b6bcd0901050659k4679c64egffcfa054da4c9034@mail.gmail.com>
	<1231168447.6608.26.camel@localhost.localdomain>
	<70B175DB52584932819754004995AB59@PC200810230421>
	<1231839695.5973.15.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 15 Jan 2009 01:02:28 +0800
Message-Id: <1231952548.3615.66.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry, a mistake in writing: 

(Suppose wr-ratio represent the ratio of erasures due to wear-leveling
to erasure total physical erase-block erasures. )
I found that when most of the @dtype is equal to UBI_SHORTTERM, the
wr-ratio is approximately equal to 0.1%, whereas is greater than
 
0.4% 

when @dtype is always UBI_UNKNOWN. It seem that the data type call-back
policy does NOT make any sense in the current implementation.

-- 
Best regards,
Xiaochuan Xu (许小川)
