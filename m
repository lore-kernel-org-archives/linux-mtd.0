Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16zgg5-0004BW-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Apr 2002 17:28:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <UTC200204111400.OAA599785.aeb@cwi.nl> 
References: <UTC200204111400.OAA599785.aeb@cwi.nl> 
To: Andries.Brouwer@cwi.nl
Cc: linux-kernel@vger.kernel.org, mdharm-usb@one-eyed-alien.net,
    linux-mtd@lists.infradead.org
Subject: Re: Flash device IDs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 22 Apr 2002 17:25:51 +0100
Message-ID: <6448.1019492751@redhat.com>
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

Andries.Brouwer@cwi.nl said:
> In include/linux/mtd/nand_ids.h there is some information about device
> IDs and device properties of NAND flash devices.

> In drivers/usb/storage/sddr09.c there is very similar information.
> Probably both tables should be merged.

Yes, probably. If the SDDR-09 lets you talk to the raw flash rather than 
doing the SmartMedia format for you in hardware/firmware then that support
probably also wants to be separated so it can be used on any hardware. 

--
dwmw2
