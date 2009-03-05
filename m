Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LfDoA-0005Rc-D8
	for linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 13:40:21 +0000
Message-ID: <49AFD5EA.5010502@nokia.com>
Date: Thu, 05 Mar 2009 15:38:50 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/3] [MTD] Flex-OneNAND support
References: <20090303063605.GA30258@july>	<20090303124948.dda294e5.akpm@linux-foundation.org>	<49AE6907.1080702@nokia.com>
	<20090304085055.c9de6cbb.akpm@linux-foundation.org>
In-Reply-To: <20090304085055.c9de6cbb.akpm@linux-foundation.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Rohit Hagargundgi <h.rohit@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Morton wrote:
>>>> +	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
>>>> +}
>>> I wonder what the heck EUCLEAN was invented for and whether MTD's
>>> extensive use of it is appropriate.
>> UBI uses it to detect bit-flips so that data can be moved before it
>> can no longer be read.  So it is pretty much essential for flash
>> memories.
> 
> That's not the point.
> 
> My point is: for what purpose was EUNCLEAN created by whoever created
> it and, given that, is its use by MTD appropriate?  Because it does
> appear that this gets returned all the way to userspace sometimes.

I have had a look at the use of EUCLEAN and found the following:
	1. It does not seem to be defined in POSIX
	2. It may have been used by unix variants to indicate an
attempt to mount a file system whose superblock was not marked
as clean.
	3. In Linux, it is used almost exclusively by MTD, with
one exception in smbfs, from which it is tempting to conclude that
smbfs (at least) is using it incorrectly.  There is one web page
http://www.wlug.org.nz/EUCLEAN where the author suggests ENOMEDIUM
might be a better choice.

Can you point me to where EUCLEAN is returned to userspace?  I took
a quick look and couldn't see it.
