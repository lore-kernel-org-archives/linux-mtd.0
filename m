Received: from anubis.se.axis.com ([195.60.68.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRknX-00074S-Ub
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 15:26:41 +0000
Date: Thu, 3 Oct 2013 17:26:11 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Romain Izard <romain.izard.pro@gmail.com>
Subject: Re: Page corruption when writing non-sequential pages in an MLC NAND
 eraseblock
In-Reply-To: <CAMiSF3AdXYaJMd7qu0VM91e0g9CVOOdN0F_Ci4fwFrMacGLWFQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1310031723490.18310@lnxricardw.se.axis.com>
References: <CAHqTa-0d=U+W2nju8WeCJ=gL+ja8DVuK0BUquajOL6qXV5C0+g@mail.gmail.com>
 <l2grtn$svg$1@ger.gmane.org>
 <CAHqTa-3HxoQJ=wEZ_w8Vcp9VXS12=xNbiJ2v8fSsJbMb9BT_4w@mail.gmail.com>
 <alpine.DEB.2.00.1310030932150.18310@lnxricardw.se.axis.com>
 <CAHqTa-1NhB4+zNkpSe3Ojw6ZywVBrxuPY1ZcWrN47nXeoBxWBg@mail.gmail.com>
 <CAMiSF3AdXYaJMd7qu0VM91e0g9CVOOdN0F_Ci4fwFrMacGLWFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Avery Pennarun <apenwarr@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 3 Oct 2013, Romain Izard wrote:

> It's right there in the datasheet for both MLC manufacturers I have worked with.
> And it seems that even SLC flash with large blocks [1] can also have the
> same constraint.
>
> There is very interesting technical presentation from Micron [2] that explains
> all the issues with NAND flash, and that states that the write order
> is necessary
> to reduce the 'program disturb' issues.
>
> [1] http://permalink.gmane.org/gmane.linux.drivers.mtd/20182
> [2] https://www.micron.com/~/media/Documents/Products/Presentation/flash_mem_summit_jcooke_inconvenient_truths_nand.pdf

Interesting, I hadn't heard that sequential writes were a requirement for 
large-page SLC flash. I just checked the data sheet for a Samsung K9F1208 
and it doesn't mention it at all. That's just one of many of course, and 
it could still be that sequential writes reduce the likelyhood of program 
disturb errors.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
