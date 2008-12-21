Received: from web58907.mail.re1.yahoo.com ([66.196.100.236])
	by casper.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LETLe-0000vP-0Y
	for linux-mtd@lists.infradead.org; Sun, 21 Dec 2008 18:48:21 +0000
References: <mailman.11.1229706002.1545.linux-mtd@lists.infradead.org>
Date: Sun, 21 Dec 2008 10:47:15 -0800 (PST)
From: Philip Rakity <prakity@yahoo.com>
Subject: Re: UBIFS option to make volume not do compression
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <509116.73555.qm@web58907.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>From Documentation/filesystems/ubifs.txt:

>compr=none              override defoult comressor and set it to "none"
>compr=lzo               override defoult comressor and set it to "lzo"
>compr=zlib              override defoult comressor and set it to "zlib"

>Just make sure you use up-to-date UBIFS, because this was added
>recently. And I guess this should also be mentioned somewhere on the web
>site.

Source browsed the mtd git on the mtd website.  No references to the above in
the documentation.  Did I look at wrong git ?

An FAQ edit would be nice.

Philip



      
