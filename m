Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181RIZ-0007Hc-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 13:59:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F225IaX31lKxtLUNYMy00017f3e@hotmail.com> 
References: <F225IaX31lKxtLUNYMy00017f3e@hotmail.com> 
To: "vijay vijay" <vijay_peshkar@hotmail.com>
Cc: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
Subject: Re: mtd, jffs and bootloader.. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 Oct 2002 13:59:44 +0100
Message-ID: <10840.1034686784@passion.cambridge.redhat.com>
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

vijay_peshkar@hotmail.com said:
>  1. Can I put my bootloader in a seperate partition say mtd0 ?.

Yes.

?  2. Since its my home built bootloader, am not sure how to tell ffs about
> its location.( Will it matter?.) Am scared that the partition table /
> any ffs data struct may overwrite bootloader and if that happens,
> don't have any tool to reflash and bring up the board.

Please explain which part of the existing partition code for other boards 
you have looked at, and which part is still unclear.

> 3.Am unable to locate any detailed text on cramfs. Can you suggest one?.

linux/Documentation/filesystems/cramfs.txt

--
dwmw2
