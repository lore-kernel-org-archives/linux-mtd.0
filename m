Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LHCq1-0008WM-Ct
	for linux-mtd@lists.infradead.org; Mon, 29 Dec 2008 07:46:57 +0000
Message-ID: <495882DE.3090708@nokia.com>
Date: Mon, 29 Dec 2008 09:57:18 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Ashish Pareek <ashish.pareek@drishyasystems.com>
Subject: Re: MTD Limitations
References: <B7FB0517CFA8454BAB8C36E3A1ABABF2@drishyanb2>
In-Reply-To: <B7FB0517CFA8454BAB8C36E3A1ABABF2@drishyanb2>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ashish Pareek wrote:
> Does MTD has Limitations to support Nand Flash <=4GB ? Has this issue is fixed in latest MTD GIT ?

The latest MTD GIT does support 4GB NAND flash, however you will
need to check your particular driver does not have limitations.

Please be aware that the ioctls used by mtd-utils are limited to
32-bit sizes.  That means they do *not* support 4GiB, but they are
probably OK for less than 4GiB i.e. 4GiB minus one eraseblock size.
