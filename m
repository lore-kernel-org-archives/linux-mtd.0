Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17B8pM-0002Eg-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 07:45:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001001c20348$03f34b40$030010ac@sunyard.com.vn> 
References: <001001c20348$03f34b40$030010ac@sunyard.com.vn> 
To: "Pham Cong Thien" <thien@tlnet.com.vn>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: Help me with mtd, pls. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 24 May 2002 07:45:16 +0100
Message-ID: <1410.1022222716@redhat.com>
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

thien@tlnet.com.vn said:
> NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
>  nftla:end_request: I/O error, dev 5d:00 (unknown), sector 0
> end_request: I/O error, dev 5d:00 (unknown), sector 0 

That's odd. It seems to be returning an I/O error without saying why. 
Can you enable MTD debugging and also run nftldump on the offending 
DiskOnChip?

--
dwmw2
