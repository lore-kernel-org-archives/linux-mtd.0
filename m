Received: from web15708.mail.cnb.yahoo.com ([202.165.102.75])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C8Fyl-0001d3-BP
	for linux-mtd@lists.infradead.org; Fri, 17 Sep 2004 06:28:39 -0400
Message-ID: <20040917102830.15782.qmail@web15708.mail.cnb.yahoo.com>
Date: Fri, 17 Sep 2004 18:28:30 +0800 (CST)
From: <gyf606-mtd@yahoo.com.cn>
To: David Woodhouse <dwmw2@infradead.org>, gyf606-mtd@yahoo.com.cn
In-Reply-To: <1095409577.9144.2417.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 filesystem on flash problem CRC errpr
Reply-To: gyf606-mtd@yahoo.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 --- David Woodhouse <dwmw2@infradead.org> wrote:
> On Fri, 2004-09-17 at 10:31 +0800, gyf606-mtd@yahoo.com.cn wrote:
> > Thank you for your attention, Mr. Woodhouse. I followed your suggestion, but the problem still
> > exists. Do you think maybe that's because of the bad format of the jffs2 image file(fs1.img)?
> > How can I get a good file to be mounted ? Is it platform independent? 
> 
> The only platform-dependence is the endianness, and if you had that
> wrong it wouldn't manifest itself as CRC errors.
> 
> Can you read back the contents of the flash from /dev/mtd4 immediately
> after writing them, but before you attempt to mount JFFS2? Check that
> there is no corruption there.
> 

Yes, I can read back from /dev/mtd4 immediately after writing them! 
And the bytes are exactly what I have copied(i.e. the jffs2 image file).


_________________________________________________________
Do You Yahoo!?
150万曲MP3疯狂搜，带您闯入音乐殿堂
http://music.yisou.com/
美女明星应有尽有，搜遍美图、艳图和酷图
http://image.yisou.com
1G就是1000兆，雅虎电邮自助扩容！
http://cn.rd.yahoo.com/mail_cn/tag/1g/*http://cn.mail.yahoo.com/event/mail_1g/
