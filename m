From: David Woodhouse <dwmw2@infradead.org>
To: gyf606-mtd@yahoo.com.cn
In-Reply-To: <20040917102830.15782.qmail@web15708.mail.cnb.yahoo.com>
References: <20040917102830.15782.qmail@web15708.mail.cnb.yahoo.com>
Content-Type: text/plain
Message-Id: <1095417230.31730.48.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 17 Sep 2004 11:33:51 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 filesystem on flash problem CRC errpr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-09-17 at 18:28 +0800, gyf606-mtd@yahoo.com.cn wrote:
> Yes, I can read back from /dev/mtd4 immediately after writing them! 
> And the bytes are exactly what I have copied(i.e. the jffs2 image file).

What if you read it back a byte at a time? ('dd bs=1') 
Or three bytes at a time?

-- 
dwmw2
