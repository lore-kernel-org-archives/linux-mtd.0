Received: from mout.web.de ([212.227.17.12])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDHgh-0001GH-KU
 for linux-mtd@lists.infradead.org; Mon, 19 Jan 2015 19:08:37 +0000
Message-ID: <54BD55F6.6090609@users.sourceforge.net>
Date: Mon, 19 Jan 2015 20:07:34 +0100
From: SF Markus Elfring <elfring@users.sourceforge.net>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] MTD: Deletion of checks before the function call "iounmap"
References: <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54BBE87C.9020705@users.sourceforge.net>
 <20150119175835.GH9759@ld-irv-0074> <54BD4AB6.70708@users.sourceforge.net>
 <20150119183057.GI9759@ld-irv-0074>
In-Reply-To: <20150119183057.GI9759@ld-irv-0074>
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

>> I published scripts for static source code analysis in March 2004.
> 
> I didn't ask "when?"; where?

https://lkml.org/lkml/2014/3/5/356
http://article.gmane.org/gmane.comp.version-control.coccinelle/3513/
https://systeme.lip6.fr/pipermail/cocci/2014-March/000676.html

Do you get further ideas from this software analysis approach?

Regards,
Markus
