From: David Woodhouse <dwmw2@infradead.org>
To: gyf606-mtd@yahoo.com.cn
In-Reply-To: <20040917023100.99191.qmail@web15707.mail.cnb.yahoo.com>
References: <20040917023100.99191.qmail@web15707.mail.cnb.yahoo.com>
Content-Type: text/plain
Message-Id: <1095409577.9144.2417.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 17 Sep 2004 09:26:17 +0100
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

On Fri, 2004-09-17 at 10:31 +0800, gyf606-mtd@yahoo.com.cn wrote:
> Thank you for your attention, Mr. Woodhouse. I followed your suggestion, but the problem still
> exists. Do you think maybe that's because of the bad format of the jffs2 image file(fs1.img)?
> How can I get a good file to be mounted ? Is it platform independent? 

The only platform-dependence is the endianness, and if you had that
wrong it wouldn't manifest itself as CRC errors.

Can you read back the contents of the flash from /dev/mtd4 immediately
after writing them, but before you attempt to mount JFFS2? Check that
there is no corruption there.

I'm a little suspicious of the CRC which your system says it
_calculated_. It wants 0x00000000, then 0x715da5a5, then 0x56361fba,
which don't seem entirely likely to me.

-- 
dwmw2
