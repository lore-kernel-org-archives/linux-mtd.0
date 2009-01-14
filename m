Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LN1Fj-0000fU-QU
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 08:37:34 +0000
Received: by wf-out-1314.google.com with SMTP id 28so436640wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jan 2009 00:37:30 -0800 (PST)
Subject: Re: about the _dtype_ parameter
From: "xiaochuanxv@gmail.com" <xiaochuanxv@gmail.com>
To: dedekind@infradead.org
In-Reply-To: <1231839695.5973.15.camel@localhost.localdomain>
References: <ff5b6bcd0901050659k4679c64egffcfa054da4c9034@mail.gmail.com>
	<1231168447.6608.26.camel@localhost.localdomain>
	<70B175DB52584932819754004995AB59@PC200810230421>
	<1231839695.5973.15.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 15 Jan 2009 00:37:02 +0800
Message-Id: <1231951022.3615.60.camel@localhost.localdomain>
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

Hi,

On Tue, 2009-01-13 at 11:41 +0200, Artem Bityutskiy wrote:
> 
> Tried the latest ubifs-2.6 tree and @dtype is always UBI_UNKNOWN (3).
> This is also strange though, I'll look at this.

Unfortunately, if the @dtype is always UBI_UNKNOWN, this result in a
great increase in the physical erase-block erasures due to wear-leveling
processes.

(Suppose wr-ratio represent the ratio of erasures due to wear-leveling
to erasure total physical erase-block erasures. )
I found that when most of the @dtype is equal to UBI_SHORTTERM, the
wr-ratio is approximately equal to 0.1%, whereas is greater than 4% when
@dtype is always UBI_UNKNOWN. It seem that the data type call-back
policy does NOT make any sense in the current implementation.

FYI, An simple way is of making all data type UBI_SHORTTERM only,
although a bit of data are long term data. Go further and say, @dtype
can be got rid off from UBI clients (e.g., UBIFS), or classifying the
data type as TWO type(UBI_SHORTTERM and UBI_LOANGTERM).


-- 
Best regards,
Xiaochuan Xu (许小川)
