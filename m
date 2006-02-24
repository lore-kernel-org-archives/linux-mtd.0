Received: from mail.wiscore.com ([210.241.236.27] helo=server3.wiscore.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FCUrq-0000fV-Kv
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2006 23:47:52 -0500
Received: from [192.168.0.75] (milk.wiscore.com [210.241.236.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server3.wiscore.com (Postfix) with ESMTP id 857B211E
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Feb 2006 12:47:35 +0800 (CST)
Message-ID: <43FE8FE9.3060507@wiscore.com>
Date: Fri, 24 Feb 2006 12:47:37 +0800
From: Robert Liu <robertliu@wiscore.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <43FA6A26.8000005@wiscore.com>	<1140513914.2480.861.camel@localhost.localdomain>
	<43FAE356.2000401@wiscore.com>
In-Reply-To: <43FAE356.2000401@wiscore.com>
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: 7bit
Subject: Re: do R/W tests on JFFS2 and suffer  segmentation fault
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I used the same MTD and JFFS2 codes in linux-2.6.15.1 and re-run tests.
The tests passed without any segmentation fault.
Can't I use the lastest MTD and JFFS2 codes in an old kernel?

Thanks,
Robert
