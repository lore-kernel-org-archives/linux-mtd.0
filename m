Received: from venus.billgatliff.com ([209.251.101.201])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Ke7CJ-0006ZV-SJ
	for linux-mtd@lists.infradead.org; Fri, 12 Sep 2008 11:52:24 +0000
Message-ID: <48CA57F8.8030005@billgatliff.com>
Date: Fri, 12 Sep 2008 06:52:24 -0500
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: ensar.gul@multitekarge.com
Subject: Re: Maturity of JFFS2 + MTD NAND Flash Support?
References: <mailman.11.1221062402.21406.linux-mtd@lists.infradead.org>
	<48CA0C11.6080402@multitekarge.com>
In-Reply-To: <48CA0C11.6080402@multitekarge.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ensar Gul wrote:
>> AFAIK, jffs2 doesn't handle correctly bit flip on read : it won't try to 
>> copy the data on another block while the data can still be recovered 
>> by ecc.
>>
>> I believe it could be a big issue for commercial product where no 
>> corruption should happen.
>>
>>
>> Matthieu
> 
> Is there a solution to the problem stated above yet?

YAFFS?


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
