Received: from wr-out-0506.google.com ([64.233.184.238])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HMrDD-0002Ht-90
	for linux-mtd@lists.infradead.org; Thu, 01 Mar 2007 14:45:14 -0500
Received: by wr-out-0506.google.com with SMTP id 69so843659wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 01 Mar 2007 11:45:09 -0800 (PST)
Message-ID: <87f18bad0703011145j224074e7t6473b9c865a24d96@mail.gmail.com>
Date: Thu, 1 Mar 2007 21:45:01 +0200
From: "J. Doo" <doodiexx@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: NAND flash mounting problem
In-Reply-To: <20070301114052.16cf258c@dhcp-252-105.norway.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <87f18bad0702272352v44058e20x17390c10b9373930@mail.gmail.com>
	<20070228094631.2e8f7b45@dhcp-252-105.norway.atmel.com>
	<87f18bad0702280717k6d50b712j9f166eb29f2ca734@mail.gmail.com>
	<20070228170648.34bd4118@dhcp-252-105.norway.atmel.com>
	<87f18bad0702280824w7c35a320u8f4f44621ba4efdb@mail.gmail.com>
	<20070301114052.16cf258c@dhcp-252-105.norway.atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > jffs2_get_sb(): dev_name "/dev/mtd1"
>
> Ah, this should be /dev/mtdblock1, not /dev/mtd1. JFFS2 actually checks

Yep, that was the problem.
Supplying /dev/mtdblock1 solved it.

I had a few crashes with JFFS2, but it seems working. I have to do
some more tests.

Thanks,
