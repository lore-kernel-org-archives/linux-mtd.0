Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Ce3N-0005qD-00
	for <linux-mtd@lists.infradead.org>; Sat, 08 Dec 2001 09:45:53 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011208021016.28394.qmail@qis> 
References: <20011208021016.28394.qmail@qis> 
To: "Nikolai Vladychevski" <niko@isl.net.mx>
Cc: linux-mtd@lists.infradead.org
Subject: Re: nftl_format with offset 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 08 Dec 2001 09:56:28 +0000
Message-ID: <19668.1007805388@redhat.com>
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

niko@isl.net.mx said:
> NFTL Media Headers at 0x0 and 0x104000 disagree.

It doesn't like the fact that you now seem to have _two_ different NFTL 
headers, both claiming to use overlapping parts of the flash.

Erase the first two blocks of the flash, which contain the original, and 
it should use the one at offset 0x100000 happily.

In fact, I suspect you should erase the whole device (with 'eraseall'), as 
it's complaining about factory-marked bad zones which are probably _not_ 
actually marked as such from the factory - the normal operation of the 
NFTL format can leave a sector in that state, whereas the SmartMedia format 
mandates that you leave that particular byte alone. 

--
dwmw2
