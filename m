Received: from mail-ie0-x22c.google.com ([2607:f8b0:4001:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VX33l-0001Ka-Bb
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 05:57:17 +0000
Received: by mail-ie0-f172.google.com with SMTP id tp5so5911267ieb.17
 for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2013 22:56:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5260B3AE.9070308@ti.com>
References: <20131015111647.GX2443@sirena.org.uk> <525D2BB3.4020705@ti.com>
 <20131015124656.GM2443@sirena.org.uk> <525D41E2.30206@ti.com>
 <20131015180142.GS23337@ld-irv-0074.broadcom.com>
 <CA+7tXigv1Q3BPE3uhzdJpx3DsqUpxzrBUaPfWR-i15PsVtMWsQ@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA23640@DBDE04.ent.ti.com>
 <525FD715.50703@ti.com> <20131017123850.GN2443@sirena.org.uk>
 <20980858CB6D3A4BAE95CA194937D5E73EA27E10@DBDE04.ent.ti.com>
 <20131017234230.GZ2443@sirena.org.uk> <5260B3AE.9070308@ti.com>
Date: Thu, 17 Oct 2013 22:56:53 -0700
Message-ID: <CA+7tXihUBXK61cRDmn3tnY9FM7FUSZrhPpLry2VAfvwWJpJ6gQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
From: Trent Piepho <tpiepho@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Peter Korsgaard <peter@korsgaard.com>, "Balbi, Felipe" <balbi@ti.com>,
 Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 17, 2013 at 9:06 PM, Sourav Poddar <sourav.poddar@ti.com> wrote:
> On Friday 18 October 2013 05:12 AM, Mark Brown wrote:
>>> Are you looking for comparison between  read_via_dma() v/s memcpy() ?
>>
>> No, I'm looking for a comparison of normal SPI mode (which I'd have
>> expected to DMA) and the memcpy() mode.
>>
>>> If yes, then unfortunately we are bit constrained because our controller
>>> does not support DMA. So, we have to depend on CPU based memcpy()
>>> only. However, use of DMA can be added as an independent patch on
>>> top of this CASE-2 patch.
>>
>> However if the controller can't DMA at all then that's not going to be
>> possible...  am I understanding you correctly that normal SPI can't DMA?
>
> Yes, you are correct, the normal SPI cant DMA.

Hardware limitation or driver limitation?  Adding DMA support to the
driver might be much more useful than adding memory mapped read
support.
