Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BV9XV-0001M9-N5
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2004 09:42:50 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E79351812A4@atcml01.atc.army.mil>
References: <EFF9A3506F74924AB5CC77BDC66E79351812A4@atcml01.atc.army.mil>
Content-Type: text/plain
Message-Id: <1086097361.26119.213.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 01 Jun 2004 14:42:42 +0100
Content-Transfer-Encoding: 7bit
Cc: gerg@snapgear.com, linux-mtd@lists.infradead.org
Subject: Re: DOC Mill Plus 32M  What next?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-06-01 at 09:39 -0400, Carlos, John J USAATC wrote:
> What tools can I use on the chip to prepare it for use??  Nftl_format
> reports wrong erase size of 0x10000?  I have read others postings and I am
> not sure if I should be using nftl_format anyway?  Can soemone please tell
> me the proper procedure to prep the chip for a jffs2 file system???

Use the DOS tools if you can. Or look on SnapGear's web site to see if
you can find an 'inftl_format' tool. 

-- 
dwmw2
