Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEUSQ-00008N-Qw
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 05:07:55 +0000
Received: by mail-wm0-x241.google.com with SMTP id m203so25458865wma.3
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2016 21:07:34 -0800 (PST)
Subject: Re: [PATCH 1/1] mtd: spi-nor: remove WARN_ONCE() message in
 spi_nor_write()
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <0078578d0f5d2402ac623afabf601d25998f84a9.1481044434.git.cyrille.pitchen@atmel.com>
 <096f8b4c-b00a-af89-e667-7385226c2e7e@gmail.com>
 <0b871c04-c105-ec94-441c-481e9773f19e@wedev4u.fr>
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, richard@nod.at
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <7dd7fecc-7f03-659a-ef00-a1ad69daceca@gmail.com>
Date: Wed, 7 Dec 2016 04:07:05 +0100
MIME-Version: 1.0
In-Reply-To: <0b871c04-c105-ec94-441c-481e9773f19e@wedev4u.fr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/07/2016 12:38 AM, Cyrille Pitchen wrote:
> Le 06/12/2016 à 20:00, Marek Vasut a écrit :
>> On 12/06/2016 06:14 PM, Cyrille Pitchen wrote:
>>> This patch removes the WARN_ONCE() test in spi_nor_write().
>>> This macro triggers the display of a warning message almost every time we
>>> use a UBI file-system because a write operation is performed at offset 64,
>>> which is in the middle of the SPI NOR memory page. This is a valid
>>> operation for ubifs.
>>
>> Is that a valid operation for all spi nors ?
>>
> 
> AFAIK, yes, it is. First we need to erase a sector or a block, then we
> can send page program commands to write data into the memory. We cannot
> write more than a page size within a single page program command but you
> can write less and start in the middle of a page if you want.

I wasn't aware this partial and even unaligned programming was available
on all chips, OK.

> I don't know whether we could cross the page boundary if we start
> writing from the middle of a page as long as we write less data than a
> single page size. However spi_nor_write() don't do so, this is why it
> computes
> page_remain = min_t(size_t, nor->page_size - page_offset, len - i)

No, I don't think we can, I believe the PP would wrap around and program
the same page from the beginning.

> Well, now looking at the Spansion S25FL127S datasheet, the address is
> wrapped if we cross the page boundary:

Yeah, this matches my mental model.

> "Depending on the device configuration, the page size can either be 256
> or 512 bytes. Up to a page can be provided on SI after the 3-byte
> address with instruction 02h or 4-byte address with instruction 12h has
> been provided. If the 9 least significant address bits (A8-A0) are not
> all 0, all transmitted data that goes beyond the end of the current page
> are programmed from the start address of the same page (from the address
> whose 9 least significant bits (A8-A0) are all 0) i.e. the address wraps
> within the page aligned address boundaries. This is a result of only
> requiring the user to enter one single page address to cover the entire
> page boundary."
> 
> Then from Adesto AT25DF321A datasheet:
> "If the starting memory address denoted by A23-A0 does not fall on an
> even 256-byte page boundary (A7-A0 are not all 0), then special
> circumstances regarding which memory locations to be programmed will
> apply. In this situation, any data that is sent to the device that goes
> beyond the end of the page will wrap around back to the beginning of the
> same page. For example, if the starting address denoted by A23-A0 is
> 0000FEh, and three bytes of data are sent to the device, then the first
> two bytes of data will be programmed at addresses 0000FEh and 0000FFh
> while the last byte of data will be programmed at address 000000h. The
> remaining bytes in the page (addresses 000001h through 0000FDh) will not
> be programmed and will remain in the erased state (FFh). In addition, if
> more than 256-bytes of data are sent to the device, then only the last
> 256-bytes sent will be latched into the internal buffer."
> 
> 
> Besides, the wear leveling is handled by the ubi layer I guess, at the
> spi-nor level we write raw data. Maybe Richard and Boris could tell us
> more but talking with them I've understood that's it is normal for the
> ubi layer to write at offset 64.

I'd understand RMW, but pure write seems a bit odd.


-- 
Best regards,
Marek Vasut
