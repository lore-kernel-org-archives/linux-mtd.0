Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D1Jpf-0008EN-TI
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 02:42:48 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1D1Jmy-0008LQ-HY
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 08:40:00 +0100
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Feb 2005 08:40:00 +0100
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Feb 2005 08:40:00 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Wed, 16 Feb 2005 08:41:39 +0100
Message-ID: <cuutan$jl7$2@sea.gmane.org>
References: <004a01c512c2$60b92930$6ffea8c0@banana>
	<1108454688.26412.18.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108454688.26412.18.camel@sauron.oktetlabs.ru>
Sender: news <news@sea.gmane.org>
Subject: Re: Bug in jffs2/scan.c re: incorrect assumption of "all clean"block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>I believe there is a bug in fs/jffs2/scan.c that causes it to 
=== 8< 8< 8< ===
>>>Is your flash NOR or NAND?
>>The part is NOR flash (Intel 28F320C3).
So will this bug effect NAND users, as well?

// Martin
