Received: from mailout10.sul.t-online.com ([194.25.134.21])
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18g6iP-0007QQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 17:18:34 +0000
To: Phil Thompson <phil@river-bank.demon.co.uk>
Cc: joakim.tjernlund@lumentis.se,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
In-reply-to: Your message of "Tue, 04 Feb 2003 16:44:40 GMT."
             <200302041644.40551.phil@river-bank.demon.co.uk>
Date: Tue, 04 Feb 2003 18:17:55 +0100
Message-Id: <20030204171800.6426FC608E@atlas.denx.de>
Subject: Re: Different zlib CRC Algorithms 
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
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

In message <200302041644.40551.phil@river-bank.demon.co.uk> you wrote:
>
> Why does ppcboot/uboot have two versions of crc32()? What's the difference 
> between them?

Quote from U-Boot's "lib_generic/crc32.c":

uLong ZEXPORT crc32(crc, buf, len)
...
    crc = crc ^ 0xffffffffL;
...
    return crc ^ 0xffffffffL;
}   
...
/* No ones complement version. JFFS2 (and other things ?)
 * don't use ones compliment in their CRC calculations.
 */ 
uLong ZEXPORT crc32_no_comp(uLong crc, const Bytef *buf, uInt len)
{   
...
    return crc;
}   


The difference is the "^ 0xffffffffL" part;  if  this  justifies  the
existence  of  another  function  is  another  question  (it would be
trivial to hide this is a macro or such).

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
To program is to be.
