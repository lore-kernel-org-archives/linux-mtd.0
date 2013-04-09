Received: from webbox1416.server-home.net ([77.236.96.61])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UPTvK-0003Xm-LZ
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2013 08:29:04 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Thomas.Betker@rohde-schwarz.com
Subject: Re: serial Flash over SPI as rootdevice?
Date: Tue, 09 Apr 2013 10:28:58 +0200
Message-ID: <4196867.FVmTr7jyS0@ws-stein>
In-Reply-To: <OF633E5F6C.FD0B7251-ONC1257B48.002C663F-C1257B48.002DE886@rohde-schwarz.com>
References: <5322202.sSFaOpDNta@ws-stein>
 <OF633E5F6C.FD0B7251-ONC1257B48.002C663F-C1257B48.002DE886@rohde-schwarz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Thomas,

On Tuesday 09 April 2013 10:21:26, Thomas.Betker@rohde-schwarz.com wrote:
> Hello Alexander:
> 
> > is it currently possible to use a serial Flash connected over SPI to
> > use as a rootdevice?
> > If not, would it be possible and which drivers need to be written 
> > for that then?
> 
> Yes, it is certainly possible; we are doing it ourselves. No extra drivers 
> are required for this beyond those you need anyway (SPI driver, SPI flash 
> driver).

That sound great. Could you please point me to the driver needed for that? Do you have any performance comparisons to e.g. NOR flash?

> The real problem, though, is that you cannot boot from standard SPI flash. 
> For this, you need memory which can be read directly by the CPU, such as 
> parallel NOR flash.

Well, the idea is to use an AT91 which can boot directly from serial flash with it's own ROM code. This would load the bootloader (will be u-boot likely) which in turns needs to fetch the kernel from the serial flash too. Should be possible, no?

Best regards,
Alexander
