Received: from web15102.mail.cnb.yahoo.com ([202.165.103.71])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FP8ZM-0002nF-4Z
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 20:37:05 -0500
Message-ID: <20060331013014.73949.qmail@web15102.mail.cnb.yahoo.com>
Date: Fri, 31 Mar 2006 09:30:14 +0800 (CST)
From: =?gb2312?q?=D6=EC=20=D6=EC?= <peterjzhu@yahoo.com.cn>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
Subject: disappointed result on enabling EBS on Samsung small page NAND chip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello,

Recently I enanbled EBS with 2.6.15 on Samsung small
page(oobblock = 512B)NAND chip. The results is as
following:

            Without EBS       With EBS

Imagesize  31378292B         42379624B

Mouttime   17s ~             14s ~

The overhead space is too much while providing NOT
high mout time improvement But from the thread
http://mhonarc.axis.se/jffs-dev/msg01763.html,my
results seems too bad compared with what's claimed. 

The only diff I can imagine is that he might use big
page NAND. Any hints are very much appreciated. 

Thanks
Peter
   




	

	
		
___________________________________________________________ 
—≈ª¢1G√‚∑—” œ‰∞Ÿ∑÷∞Ÿ∑¿¿¨ª¯–≈ 
http://cn.mail.yahoo.com/
