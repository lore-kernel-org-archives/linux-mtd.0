Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbKVV-0005zB-Lm
	for linux-mtd@lists.infradead.org; Thu, 26 May 2005 11:42:50 -0400
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 55D942F016
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 15:50:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id B710A11C51
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 17:42:46 +0200 (CEST)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 0E71F9BD9
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 17:42:46 +0200 (CEST)
Message-ID: <4295EE70.8000608@imc-berlin.de>
Date: Thu, 26 May 2005 17:42:40 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <20050526152256.GS6681@pengutronix.de> <4295ED9E.6000508@arcom.com>
In-Reply-To: <4295ED9E.6000508@arcom.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Fast rollout process on jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Vrabel wrote:

> Robert Schwebel wrote:
> 
>>Is there a method for faster rollout of an embedded root filesystem on
>>jffs2? I'm currently first erase the chip from u-boot, then copy the
>>image created with mkfs.jffs2 into the empty flash. On first startup it
>>seems to detect that the partition is larger than the actual image and
>>it takes quite some time before the / mount is finished. 
>>
>>Does anybody know a faster variant? 
> 
> 
> You can pad the JFFS2 image with the --pad option to mkfs.jffs2.

But isn't it padded with 0xFF only?

Or will it place the magic "1985 2003" as well?

--
Steven
