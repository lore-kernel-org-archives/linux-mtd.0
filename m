Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FCZcD-0006Bu-9m
	for linux-mtd@lists.infradead.org; Fri, 24 Feb 2006 04:51:59 -0500
Message-ID: <43FED715.7070104@yandex.ru>
Date: Fri, 24 Feb 2006 12:51:17 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
References: <43EB96DC.3030900@eptar.com>	<35fb2e590602100558s2d868fa3o1752fbf3217439e4@mail.gmail.com>	<d97046180602151153g23064424x9e1ddf83a1d7ae4f@mail.gmail.com>	<200602161432.17447.manningc2@actrix.gen.nz>
	<43FD72E8.9080203@ru.mvista.com>
In-Reply-To: <43FD72E8.9080203@ru.mvista.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: William Watson <wjw1961@gmail.com>,
	Charles Manning <manningc2@actrix.gen.nz>,
	linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vitaly Wool wrote:
> And... I do not like the idea to remove OOB-handling stuff from the MTD 
> layer. I also do not like the idea to make a separate interface for NAND 
> layer, I'm afraid this will lead to confusion and hard to track errors.
Having a generalize MTD layer on top of NAND, NOR, etc layers cannot 
lead to any confusion. What can confuse you? This is just a nice layering.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
