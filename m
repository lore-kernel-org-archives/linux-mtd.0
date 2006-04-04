Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQh5N-0002xf-CK
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 04:40:35 -0400
Message-ID: <44323102.8030606@inf.u-szeged.hu>
Date: Tue, 04 Apr 2006 10:40:34 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Peter J Zhu <peterjzhu@yahoo.com.cn>
References: <20060404020154.30683.qmail@web15103.mail.cnb.yahoo.com>
In-Reply-To: <20060404020154.30683.qmail@web15103.mail.cnb.yahoo.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: EBS effect
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Peter,

>  The overhead space is too much while providing NOT
>  high mout time improvement But from the thread
>  http://mhonarc.axis.se/jffs-dev/msg01763.html, 
>  results seems too bad compared with what's claimed. 
>
>  The only diff I can imagine is that he might use big
>  page NAND. Any hints are very much appreciated. 
>  
>
The size of the overhead space and the rate of speedup depend on the
size of the erase blocks, not the page size.

What is the size of your erase block? If it is small, unfortunatelly EBS
will not be too effective.

BR,
Ferenc
