Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGkg0-0002UW-7j
 for linux-mtd@lists.infradead.org; Thu, 10 May 2018 12:28:06 +0000
Received: by mail-wr0-x233.google.com with SMTP id h5-v6so1841696wrm.4
 for <linux-mtd@lists.infradead.org>; Thu, 10 May 2018 05:27:53 -0700 (PDT)
Subject: Re: [PATCH/RFC] mtd: spi-nor: honour max_message_size for spi-nor
 writes.
To: NeilBrown <neil@brown.name>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <87efj1kw9u.fsf@notabene.neil.brown.name>
 <20180509160240.23ef11f2@bbrezillon>
 <87vabwa2gm.fsf@notabene.neil.brown.name>
 <cb612906-3d52-66cd-fbbc-7872bd2d9a92@gmail.com>
 <87mux7afkv.fsf@notabene.neil.brown.name>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1bb32a4e-55cf-f5f2-60f5-2213f31d54ac@gmail.com>
Date: Thu, 10 May 2018 14:27:51 +0200
MIME-Version: 1.0
In-Reply-To: <87mux7afkv.fsf@notabene.neil.brown.name>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/10/2018 01:57 PM, NeilBrown wrote:
> On Thu, May 10 2018, Marek Vasut wrote:
> 
>> On 05/10/2018 12:28 AM, NeilBrown wrote:
>>> On Wed, May 09 2018, Boris Brezillon wrote:
>>>
>>>> On Fri, 27 Apr 2018 16:18:05 +1000
>>>> NeilBrown <neil@brown.name> wrote:
>>>>
>>>>> Hi,
>>>>>  I've labeled this an RFC because I'm really not sure about removing the
>>>>>  error path from spi_nor_write() -- maybe that really matters.  But on
>>>>>  my hardware, performing multiple small spi writes to the flash seems
>>>>>  to work.
>>>>>
>>>>>  The spi driver is drivers/staging/mt7621-spi.  Possibly this needs to
>>>>>  use DMA instead of a FIFO (assuming the hardware can) - or maybe
>>>>>  drivers/spi/spi-mt65xx.c can be made to work on this hardware, though
>>>>>  that is for an ARM SOC and mt7621 is a MIPS SOC.
>>>>>
>>>>>  I note that openwrt has similar patches:
>>>>>   target/linux/generic/pending-4.14/450-mtd-spi-nor-allow-NOR-driver-to-write-fewer-bytes-th.patch
>>>>>
>>>>>  They also change the spi driver to do a short write, rather
>>>>>  than change m25p80 to request a short write.
>>>>>
>>>>>  Is there something horribly wrong with this?
>>>>
>>>> Marek, any opinion on this patch?
>>>>
>>>
>>> Hi,
>>>  thanks for following up.
>>>  I have since found that I don't need this patch, though maybe others
>>>  still do(??).
>>>  My hardware can only send 36 bytes and receive 32 in a single
>>>  transaction.  However I can run a sequence of transactions
>>>  to process a whole message no matter how large that message is.  As
>>>  long as I keep chip-select asserted, all the slave device sees is that
>>>  the clock period isn't quite constant, and the slave shouldn't care
>>>  much about that.
>>>  When reading from flash, I found that handling large messages with
>>>  multiple hardware transactions was 50% faster than breaking the
>>>  read down into lots of 32 byte messages.
>>>
>>>  So, I won't object if this patch is forgotten.  Thanks for
>>>  your time anyway.
>>
>> Nice, which hardware is that ?
> 
> Mediatek MT7621 SOC (particularly in the gnubee.org NAS platform).

On nice, a mips, good to see someone still cares about mips :)

-- 
Best regards,
Marek Vasut
