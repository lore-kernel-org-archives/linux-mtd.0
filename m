Received: from mail.auriga.ru ([80.240.102.102])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGFUY-0007O6-1U
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2004 12:02:10 +0100
Message-ID: <408654B9.6080004@auriga.ru>
Date: Wed, 21 Apr 2004 15:02:17 +0400
From: Dmitry Konyshev <dmitry.konyshev@auriga.ru>
MIME-Version: 1.0
To: David Vrabel <dvrabel@arcom.com>
References: <40863DC6.4010707@auriga.ru> <40863F9A.2000109@arcom.com>
In-Reply-To: <40863F9A.2000109@arcom.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: AMD & Fujitsu CFI driver problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Vrabel wrote:

> That's correct. chip_status() is broken for interleaved chips.  Which 
> is why the latest version (1.98) in CVS no longer uses it.  Update and 
> see if that fixes the issue.
>
Thanks a lot, it actually fixes the issue.

wbr, Dmitry
