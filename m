Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U3I2-0007Ex-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 10:36:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <12120674119.20010801143442@mail.ru> 
References: <12120674119.20010801143442@mail.ru> 
To: ASA <atris@mail.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: got stuck with DoC 2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 10:42:24 +0100
Message-ID: <31963.997177344@redhat.com>
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

atris@mail.ru said:
>   /dev/mtd char 90,0
>    /dev/nftl block 93,0
>    /dev/nftl1 block 93,1
>    /dev/nftl2 block 93,2
>    /dev/nftl3 block 93,3
>    /dev/nftl4 block 93,4 

Those are all slightly wrong. There's a 'MAKEDEV' script in CVS which will 
create the correct ones.


atris@mail.ru said:
>  cannot find driver for DiskOnChip Millenium at 0xd0000
>  cannot find driver for DiskOnChip Millenium at 0xd2000

grep --context=6 DOC_SINGLE_DRIVER Documentation/Configure.help 

--
dwmw2
