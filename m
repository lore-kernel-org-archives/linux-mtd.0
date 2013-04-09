Received: from mail02.rohde-schwarz.com ([80.246.32.97])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UPToS-0003Ih-Qv
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2013 08:21:57 +0000
In-Reply-To: <5322202.sSFaOpDNta@ws-stein>
References: <5322202.sSFaOpDNta@ws-stein>
To: Alexander Stein <alexander.stein@systec-electronic.com>
MIME-Version: 1.0
Subject: Re: serial Flash over SPI as rootdevice?
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF633E5F6C.FD0B7251-ONC1257B48.002C663F-C1257B48.002DE886@rohde-schwarz.com>
Date: Tue, 9 Apr 2013 10:21:26 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Alexander:

> is it currently possible to use a serial Flash connected over SPI to
> use as a rootdevice?
> If not, would it be possible and which drivers need to be written 
> for that then?

Yes, it is certainly possible; we are doing it ourselves. No extra drivers 
are required for this beyond those you need anyway (SPI driver, SPI flash 
driver).

The real problem, though, is that you cannot boot from standard SPI flash. 
For this, you need memory which can be read directly by the CPU, such as 
parallel NOR flash.

Best regards,
Thomas
