From: David Woodhouse <dwmw2@infradead.org>
To: Albrecht =?ISO-8859-1?Q?Dre=DF?= <albrecht.dress@lios-tech.com>
In-Reply-To: <446C4265.8090108@lios-tech.com>
References: <446C4265.8090108@lios-tech.com>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 May 2006 12:49:04 +0100
Message-Id: <1147952944.3875.61.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [OT?] File system recommendation for SD cards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-05-18 at 11:46 +0200, Albrecht Dreß wrote:
> Would using JFFS2 on the SD card improve the lifetime of the device?

Possibly, yes.

> Does anyone have experiences about the achievable lifetime in my
> scenario, for both vfat or jffs2?
> How would I practically set up a jffs2 fs on the sd card?

The SD card won't present itself as a normal flash device. It has flash
_internally_ but you can't get at it directly -- you can only treat it
like a hard drive with 512-byte sectors. So you need to use the
'block2mtd' driver so that you can use it as an MTD device and use JFFS2
on it.

-- 
dwmw2
