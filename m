Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eoQsL-0000Ka-KX
 for linux-mtd@lists.infradead.org; Wed, 21 Feb 2018 09:39:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Wed, 21 Feb 2018 10:39:32 +0100
From: Stefan Agner <stefan@agner.ch>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v3 2/3] mtd: nand: vf610_nfc: make use of ->exec_op()
In-Reply-To: <20180221100308.440caee5@bbrezillon>
References: <20180208235921.31840-1-stefan@agner.ch>
 <20180208235921.31840-3-stefan@agner.ch>
 <20180211115452.29cee45e@bbrezillon>
 <8898b2bd6b9b904f24b862d6df55ac40@agner.ch>
 <8898b2bd6b9b904f24b862d6df55ac40@agner.ch>
 <20180221081812.79e912a5@bbrezillon>
 <e5d20aa9a17caaa79a3618367f22637f@agner.ch>
 <20180221100308.440caee5@bbrezillon>
Message-ID: <c04fe887a26de6092b44eabfd7d3147e@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21.02.2018 10:03, Boris Brezillon wrote:
> On Wed, 21 Feb 2018 09:30:32 +0100
> Stefan Agner <stefan@agner.ch> wrote:
> 
>>
>> >
>> > The only exception I can think of is when you have DATA_OUT+CMD. In
>> > this case, you probably want to skip CMD_BYTE1 and use CMD_BYTE2
>> > directly, but that can easily be taken care of in the alternative
>> > implementation I proposed:
>> >
>> > 		if (instr->type == NAND_OP_DATA_OUT_INSTR) {
>> > 			/*
>> > 			 * If there was no CMD instruction before the
>> > 			 * DATA_OUT one, we must skip CMD_BYTE1 and use
>> > 			 * CMD_BYTE2 directly so that the CMD cycle is
>> > 			 * really placed after the DATA_OUT one.
>> > 			 */
>> > 			if (!ncmds)
>> > 				ncmds++;
>> > 			....
>> > 		}
>> >
>> >
>>
>> I fully understand, I do not have to enforce order since I can rely on
>> the order passed by the stack.
>>
>> It is also not what I am after. I just check which operation is going to
>> be next. Like your switch statement.
>>
>> I just see don't see a real advantage in using a for loop. It makes it
>> harder to read, since the order of operations will no more be obvious.
>> It makes this ncmd work around necessary.
>>
>> Using a for loop just because we can? I haven't seen a convincing
>> argument so far.
>>
> 
> I still prefer the for-loop+switch approach (I find it cleaner), but
> that's probably a matter of taste.
> 

Let me make a cleaned up version of the if approach and then decide.

>>
>> >> I think you have the same endianness problem you have for the READ
>> >> path. For example, I doubt SET_FEATURES will work properly if you're
>> >> in LE. So I repeat my initial suggestion: always do the byte swapping
>> >> when you're transfering data to/from the SRAM from vf610_nfc_cmd()
>> >> and use vf610_nfc_memcpy() only in the ->read/write_page()
>> >> implementations.
>> >>
>> >
>> > Hm, but doesn't that leads to wrong order of data when using e.g. raw
>> > read/write page...?
>>
>> With that last iteration I used the default implementation of the stack.
>>
>> I guess I could just implement them too and use vf610_nfc_memcpy()?
> 
> Yep (see my other email).
> 

Yes there was a race condition :-)

>>
>> This should be fine then for tdoay, but what if we have another data
>> related access in the future? It then also will make use of
>> vf610_nfc_cmd and change byte order...
> 
> I'll reply with another question: what if you need to read data that
> have been programmed by the flash vendor in some OTP sections (already
> had to do that to support read-retry on some NANDs)? There's clearly
> no ideal solution, we just have to chose the one which is less likely
> to break things in the future. Today, we have a way to overload page
> accessors, so let's use it.

Ok agreed. I guess we should clearly state somewhere what is going on.

> 
> BTW, it's not exactly about data related accesses, but accesses to data
> for which you control the read and write path (that excludes
> writes/reads to/from NAND registers like the SET/GET_FEATURES, because
> then, data are used by the internal NAND logic to tweak its behavior).

"Data related accesses which the drivers controls the read and write
path" seems like a nice summary in what case we want to avoid the byte
reordering.

--
Stefan
