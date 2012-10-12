Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMa7t-0006Vp-CJ
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2012 07:57:46 +0000
Message-ID: <5077CD73.802@parrot.com>
Date: Fri, 12 Oct 2012 09:57:39 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Charles Hardin <ckhardin@exablox.com>
Subject: Re: [QUESTION] MLC NAND and ECC over OOB area
References: <0A090286-986E-4B22-AEC3-EE1C48EC466E@gmail.com>
 <20121010181307.GB14389@parrot.com>
 <AD7F07FE-BAD4-48F6-BF24-520FA8BCFCB2@exablox.com>
In-Reply-To: <AD7F07FE-BAD4-48F6-BF24-520FA8BCFCB2@exablox.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ivan Djelic <ivan.djelic@parrot.com>, Mike Dunn <mikedunn@newsguy.com>,
 Jeremy Fitzhardinge <jeremy@exablox.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Hardin a écrit :
> On Oct 10, 2012, at 11:13 AM, Ivan Djelic wrote:
> 
>> Hi Charles,
>>
>> The OOB area is primarily used to store:
>> - a bad block marker
>> - ECC bytes
>>
>> The ECC is generally designed to protect the data area, and the ECC bytes themselves (data+ECC bytes form a long codeword).
>> The bad block marker normally has two useful values only: 0xff or 0x00, therefore it can be successfully read even with
>> several bitflips, by looking at its Hamming weight (the number of 1s in the byte).
>>
>> Now, if you want to store additional stuff (metadata) in the OOB area, _then_ you will need an ECC that covers data + metadata.
>> This is possible with some drivers; this can also be done with the software BCH library (with a patch).
>>
>> But the general trend is to avoid using the OOB area for that, because you never know how much space the next NAND generation
>> will require for ECC, and you'll be in trouble once your metadata does not fit anymore in the remaining space.
>>
>> BR,
>> -- 
>> Ivan
> 
> 
> Ok, that seems reasonable - and, following this line of thought - then the expectation would be to change the nand_bbt.c code to check for the "weight of a bad block pattern" instead of looking for an exact match on the pattern.
> 
They were some work on this :
http://thread.gmane.org/gmane.linux.drivers.mtd/42243follow d
