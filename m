Received: from web15609.mail.cnb.yahoo.com ([202.165.102.63])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CMlsx-0002ej-Gq
	for linux-mtd@lists.infradead.org; Wed, 27 Oct 2004 07:22:39 -0400
Message-ID: <20041027112229.25654.qmail@web15609.mail.cnb.yahoo.com>
Date: Wed, 27 Oct 2004 19:22:29 +0800 (CST)
From: Xin Li <xin123456.li@yahoo.com.cn>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20041022150511.22095.qmail@web15610.mail.cnb.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
Subject: warning message "CLEANMARKER node ..." on mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am trying to get JFFS2 running on my 2KB flash page
Nand flash. My nand flash driver is working. When I
mount an empty partition, I don't any mwarning message
and JFFS2 is working fine. But if I copy a JFFS2 image
to the partition and then mount it, I get many 
warning meassages regarding cleanmaker node and JFFS
is also working fine. I have erased the partition with
 "flash_eraseall -j" before I copy the image.

I also checked the OOB contents. "19 85 20 03 00 00 00
08" is at offset 0x10. I also get the same content at
offset 0x10 if I direct mount an empty partuition. The
CPU on my board is PowerPC.  

CLEANMARKER node found at 0x00000000 has totlen 0xc !=
normal 0x0
CLEANMARKER node found at 0x00020000 has totlen 0xc !=
normal 0x0
CLEANMARKER node found at 0x00040000 has totlen 0xc !=
normal 0x0
CLEANMARKER node found at 0x00060000 has totlen 0xc !=
normal 0x0
CLEANMARKER node found at 0x00080000 has totlen 0xc !=
normal 0x0
CLEANMARKER node found at 0x000a0000 has totlen 0xc !=
normal 0x0
CLEANMARKER node found at 0x000c0000 has totlen 0xc !=
normal 0x0


_________________________________________________________
Do You Yahoo!?
150万曲MP3疯狂搜，带您闯入音乐殿堂
http://music.yisou.com/
美女明星应有尽有，搜遍美图、艳图和酷图
http://image.yisou.com
1G就是1000兆，雅虎电邮自助扩容！
http://cn.rd.yahoo.com/mail_cn/tag/1g/*http://cn.mail.yahoo.com/event/mail_1g/
