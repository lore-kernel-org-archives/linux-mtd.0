Received: from webapps.arcom.com ([194.200.159.168])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BNpKL-0006Bc-Df
	for linux-mtd@lists.infradead.org; Wed, 12 May 2004 09:42:57 +0100
From: Ian Campbell <icampbell@arcom.com>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
In-Reply-To: <001f01c43779$893048f0$0319a8c0@dominio1.ingalmudi.com>
References: <001f01c43779$893048f0$0319a8c0@dominio1.ingalmudi.com>
Content-Type: text/plain
Message-Id: <1084351374.9910.10.camel@icampbell-debian>
Mime-Version: 1.0
Date: Wed, 12 May 2004 09:42:55 +0100
Content-Transfer-Encoding: 7bit
Subject: RE: symbolic link with jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-05-11 at 18:01, Jose Pascual wrote:

> I have found that symlink is broken if the length of char of the name is
> pointing is odd but not with even.
> 
> any suggestion?

Way back in the mists of time I had a similar problem which turned out
to be due to copy_from/copy_to in my mapping driver not handling
unaligned copies properly.

I'm not sure if I am remembering right and I can't find any link to any
details -- but I would start by adding some print statements to
copy_from and making sure it is working right in all cases.

Ian.

-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road, 			Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom	Phone:  +44 (0)1223 411 200
