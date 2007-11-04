Subject: Re: address lines
From: David Woodhouse <dwmw2@infradead.org>
To: "M8 (Servaes Joordens)" <Servaes.Joordens@m8.nl>
In-Reply-To: <472D9122.8010501@m8.nl>
References: <472C5368.3060306@m8.nl>
	<1194090374.9405.42.camel@pmac.infradead.org> <472C6473.8020502@m8.nl>
	<1194091981.9405.47.camel@pmac.infradead.org> <472C694C.7020103@m8.nl>
	<1194092966.9405.51.camel@pmac.infradead.org> <472D9122.8010501@m8.nl>
Content-Type: text/plain
Date: Sun, 04 Nov 2007 11:23:59 +0000
Message-Id: <1194175439.9405.63.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: mtd-forum <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2007-11-04 at 10:30 +0100, M8 (Servaes Joordens) wrote:
> I got everything working now, except for the fact that when I write 
> anything to my jffs2 partition, it fails. The error report states that
> the disk is full. Do you have any idea's?

How big is your JFFS2 partition? How big is the image you put on it to
start with? Do writes to the flash work at all from Linux? What
_precisely_ is the error yo uget?

> In the configuration, I disabled the map_funcs file and replace it
> with my own version.I had to write some code to distiguish between
> flash memory and ram. 

This seems a little strange. Can you show your code? 

-- 
dwmw2
