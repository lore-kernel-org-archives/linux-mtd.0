Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kiHB-0000Ch-DY
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 11:45:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Leandro Skladnik <lskladnik@grupoclave.com>
In-Reply-To: <C0AA6C69A265D311ACCA0090274F09AD011944B3@SALGUERO_1>
References: <C0AA6C69A265D311ACCA0090274F09AD011944B3@SALGUERO_1>
Message-Id: <1060253136.25209.41.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 07 Aug 2003 11:45:36 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: mmap with Doc Millenium
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-08-06 at 14:21, Leandro Skladnik wrote:
> Hi list members!
> 
> I have the following question:
> 
> Is it posibble to use mmap with a Disc On Chip device? Because a tried to
> use it but I received MAP_FAILED returning from mmap, and errno set to 19,
> which means, according to "errno.h", "No such Device". 

What file system are you using on the DiskOnChip?

-- 
dwmw2
