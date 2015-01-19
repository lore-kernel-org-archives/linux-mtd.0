Received: from mout.web.de ([212.227.15.4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDGwN-0001ew-U4
 for linux-mtd@lists.infradead.org; Mon, 19 Jan 2015 18:20:44 +0000
Message-ID: <54BD4AB6.70708@users.sourceforge.net>
Date: Mon, 19 Jan 2015 19:19:34 +0100
From: SF Markus Elfring <elfring@users.sourceforge.net>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] MTD: Deletion of checks before the function call "iounmap"
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54BBE87C.9020705@users.sourceforge.net>
 <20150119175835.GH9759@ld-irv-0074>
In-Reply-To: <20150119175835.GH9759@ld-irv-0074>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Anyway, I'm essentially saying that I'd like to be 100% sure we have a
> guarantee before dropping all these.

You can not be absolutely sure. There are various implementation details
which will eventually need further considerations.

I hope that a reasonable confidence can be achieved here.


>> This issue was detected by using the Coccinelle software.
> 
> What script?

I published scripts for static source code analysis in March 2004.


> Hand-rolled I guess?

An extended version found some update candidates in source files for Linux
according to the software development status of "next-20141226".

My approach is still incomplete at the moment.

Regards,
Markus
