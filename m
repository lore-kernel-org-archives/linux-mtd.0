Received: from web15003.mail.bjs.yahoo.com ([61.135.128.6])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16rqeK-0000qZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2002 02:30:20 +0100
Message-ID: <20020401012946.28635.qmail@web15003.mail.bjs.yahoo.com>
Date: Mon, 1 Apr 2002 09:29:46 +0800 (CST)
From: =?gb2312?q?jg=20zhao?= <zhao8116@yahoo.com.cn>
Subject: About 28f320c3
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi !    
  I have some questions about the TE28F320C3TA110. I
configed it as a intel CFI chip. The size of it is
4M,and the address is from 1000000 to 1400000. 1100000
to 1200000 is my kernel code and I want to put my jffs
to the 1300000-1380000. My kernel burned and running
is OK. But when I add the MTD into it ,after this
message:
       
  physmap flash device: 80000 at 1300000  

my board was dead. The  kernel is running from the
flash . The code and jffs is on the same chip.Did it
work?Thanks for giving me some suggestion!

_________________________________________________________
Do You Yahoo!? 
到世界杯主题公园玩一玩，赢取世界杯门票乐一乐。
http://cn.worldcup.yahoo.com/
