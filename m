Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCWcO-00014w-2t
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 02:44:30 -0500
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l117gD9b013321
	for <linux-mtd@lists.infradead.org>; Thu, 1 Feb 2007 09:42:16 +0200
Message-ID: <45C19A1F.4020201@nokia.com>
Date: Thu, 01 Feb 2007 09:43:27 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] OneNAND: Add support
	for	auto-placementofout-of-banddata
References: <45BA1A9D.60301@nokia.com> <45BA21E6.60301@nokia.com>
	<000101c7436b$14370420$c7a3580a@swcenter.sec.samsung.co.kr>
	<45BDACBA.2080503@nokia.com> <45BE1480.1060506@nokia.com>
	<003701c74435$0b1f61f0$c7a3580a@swcenter.sec.samsung.co.kr>
	<45C0B8D4.2000807@nokia.com>
	<005601c745a8$55787b50$c7a3580a@swcenter.sec.samsung.co.kr>
In-Reply-To: <005601c745a8$55787b50$c7a3580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
>> +	writeend = mtd->oobsize;
> 
> We don't re-assign the 'writeend'. It cause the block is not clean. Since
> JFFS2 send only 12 bytes but onenand writes until oobsize, actually 20
> bytes with zero.
> So this statement will be removed.

Yes, that was a typo.  The line should have been deleted when the previous
line was deleted.
