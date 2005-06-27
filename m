Received: from ms-smtp-03-smtplb.ohiordc.rr.com ([65.24.5.137]
	helo=ms-smtp-03-eri0.ohiordc.rr.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dmxh9-00030j-2s
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2005 13:46:57 -0400
Received: from [192.168.1.89] (rrcs-24-123-18-42.central.biz.rr.com
	[24.123.18.42])
	by ms-smtp-03-eri0.ohiordc.rr.com (8.12.10/8.12.7) with ESMTP id
	j5RHkmYF012790 for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jun 2005 13:46:52 -0400 (EDT)
Message-ID: <42C03FFB.3080208@clarionsensing.com>
Date: Mon, 27 Jun 2005 13:05:47 -0500
From: "Brian O'Dell" <brian@clarionsensing.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: DOCBoot doesn't compile
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I get the following error when compiling DOCBoot :

doc_bootstub.o(.text+0x131): In function `doc_cmd':
: undefined reference to `BX_CDSN_IO'

I have googled and grepped for BX_CDSN_IO with no results.  Any 
thoughts?  Has anyone successfully compiled the most recent docboot?

Thanks,
Brian
