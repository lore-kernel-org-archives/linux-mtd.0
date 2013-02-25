Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U9uIN-0004pa-8Q
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2013 09:24:29 +0000
Message-ID: <512B2DC6.8090104@parrot.com>
Date: Mon, 25 Feb 2013 10:24:22 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v2] mtd: nand: support BENAND (Built-in ECC NAND)
References: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
 <20980858CB6D3A4BAE95CA194937D5E73E99A025@DBDE01.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E99A025@DBDE01.ent.ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gupta, Pekon a écrit :
> Hi,
> 
>> This enables support for BENAND, which is an SLC NAND flash solution
>> with embedded error correction code (ECC), currently supports only
>> 128bytes OOB type.
>>
>> In the read sequence, "status read command" is executed to check the
>> ECC status after read data. If bitflips occur, these are
>> automatically corrected by BENAND and the status indicates the result.
>>
>> The write sequence is the same as raw write and the ECC data are
>> automatically written to OOB by BENAND.
> 
> Just inquisitive, can anyone please share any throughput comparison between 'BENAND' & 'normal NAND' devices having same capacity and working on same clock-freq ?
> 
> (a) Usually on-chip memory controllers work on faster clock frequencies, as compared to the NAND devices connected to them externally on board.
> Thus I assume, ECC computation & correction can be done at faster rate.
> 
> (b) However, on other hand BENAND(s) have luxury of accessing the Flash storage array locally, thus eliminating I/O delays | un-optimized IO signal timing from the access-path.
> 
> So, if you can share the details throughput comparison between the two types of NAND devices, under various conditions it would be helpful.
> 
You always have to transfer the data from/to the nand devices to/from the host.

- Either the ecc internal controller is fast and the throughput are the same
than 'normal nand' (assuming the ecc controller on the host is fast),
- either it is slow and the throughput is limited by the internal ecc controller
(throughput is slower than 'normal nand')


Matthieu
