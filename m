Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Waea-0002H0-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 10:38:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010814085844.VQBH19794.fep01@yunux> 
References: <20010814085844.VQBH19794.fep01@yunux> 
To: Yunus Yucel Altunbicak <yunus.altunbicak@eliar.com.tr>
Cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: flash file system 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Aug 2001 10:44:04 +0100
Message-ID: <5191.997782244@redhat.com>
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

yunus.altunbicak@eliar.com.tr said:
> The uCdimm module have atmel 2 Mb flash chip(AT49BV1614) i have read
> flash  database on http://www.embeddedLinuxWorks.com/db.html but i
> couldn't  see  support for atmel chips. Does anybody know applying it
> for uCdimm or is there  another way? 

Should work if you just add the appropriate table to the list in the 
existing cfi_jedec probe code.

--
dwmw2
