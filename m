Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCQvx-0001CH-Of
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 08:39:46 +0000
Message-ID: <51345DC6.9090504@parrot.com>
Date: Mon, 4 Mar 2013 09:39:34 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [UBIFS][CRC Mismatch]
References: <CAHeJuP946AQD2FOp1f=y_AKxXbLGYhTe1TZGOAtpNVoPbE5JEA@mail.gmail.com>
 <1362236681.2745.19.camel@sauron>
In-Reply-To: <1362236681.2745.19.camel@sauron>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Colin Foe-Parker <colin.foeparker@aclimalabs.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Tue, 2013-02-19 at 10:44 -0800, Colin Foe-Parker wrote:
>> Hi All,
>>
>> I am seeing an issue that I would love some outside help on.
>>
>> I am running UBIFS on TI's latest Linux 3.2.0 PSP (5.06.00.09) and
>> their AM3352 ARMv7a processor.  We are using a Micron MT29F2G08ABBEAHC
>> 2 Gb SLC NAND chip.  (w/ a BCH8 ECC)
>>
>> 3.) Memory Corruption: Is it possible the the write buffer can be
>> corrupted before it is written to NAND?  Hence having a bad CRC value
>> in NAND?
On some of our product we saw ubifs metadata corrupted by kernel pointer. But
the crc was good (ie corruption done before crc).

But we also saw corruption during ubi scubbing. The ubi buffer was corrupted
after the nand read but before crc compute and nand write. This cause good ubi
crc but bad ubifs crc.


What you should check is the type of corruption you have (for example by
ignoring crc failure and try to parse data).


Matthieu
