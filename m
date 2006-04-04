Received: from web15103.mail.cnb.yahoo.com ([202.165.103.72])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQayG-0004LN-3N
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 22:08:51 -0400
Message-ID: <20060404020154.30683.qmail@web15103.mail.cnb.yahoo.com>
Date: Tue, 4 Apr 2006 10:01:54 +0800 (CST)
From: Peter J Zhu <peterjzhu@yahoo.com.cn>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20060331014718.12468.qmail@web15110.mail.cnb.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
Subject: EBS effect
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
  http://mhonarc.axis.se/jffs-dev/msg01763.html, 
  results seems too bad compared with what's claimed. 

  The only diff I can imagine is that he might use big
  page NAND. Any hints are very much appreciated. 

Thanks
Peter



	

	
		
___________________________________________________________ 
—≈ª¢1G√‚∑—” œ‰∞Ÿ∑÷∞Ÿ∑¿¿¨ª¯–≈ 
http://cn.mail.yahoo.com/
