Received: from webapps.arcom.com ([194.200.159.168])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGE5X-0006zp-Av
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2004 10:32:15 +0100
Message-ID: <40863F9A.2000109@arcom.com>
Date: Wed, 21 Apr 2004 10:32:10 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <40863DC6.4010707@auriga.ru>
In-Reply-To: <40863DC6.4010707@auriga.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: AMD & Fujitsu CFI driver problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dmitry Konyshev wrote:
> 
>    I have troubles with current AMD & Fujitsu CFI driver. When it works 
> with 2 x16 devices in 32-bit mode, it fails to correctly detect ending 
> of erasure operation. Looks like that when one device reports the end of 
> operation by setting all 16 its bits in 1, the other device is not done 
> yet, and the code in chip_status() returns CHIP_TIMEDOUT because it 
> doesn't consider such a situation.

That's correct. chip_status() is broken for interleaved chips.  Which is 
why the latest version (1.98) in CVS no longer uses it.  Update and see 
if that fixes the issue.

David Vrabel
