Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrCEP-00036w-H3
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2012 18:10:46 +0000
Message-ID: <5005AA80.4010200@newsguy.com>
Date: Tue, 17 Jul 2012 11:10:08 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
 <4FFBDDB0.6010605@parrot.com>
 <CAN8TOE8g9FjgJuj+1RuQx3afaY_Huo29PZBNvXVt2-p17OF_tQ@mail.gmail.com>
 <50032194.9040703@newsguy.com> <20120716140121.GB9278@parrot.com>
 <50045F48.6050702@newsguy.com> <20120716213402.GB10244@parrot.com>
In-Reply-To: <20120716213402.GB10244@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Matthieu Castet <matthieu.castet@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
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

On 07/16/2012 02:34 PM, Ivan Djelic wrote:
> On Mon, Jul 16, 2012 at 08:36:56PM +0200, Mike Dunn wrote:
>>
>> This is a certainty, no?  Erased, by definition, includes any ecc bytes.
> 
> If you add the right polynomial[1] to your Hamming or BCH code, then you can make
> sure the ECC of an erased page (possibly with OOB bytes) is actually a sequence of 0xff bytes.
> This trick enables bitflip correction on data that has never been programmed.
> Take a look at nand_ecc.c:63 (or nand_bch.c:62) for an example.
> This trick is not possible on all hardware ECC engines.


Ah, yes, I forgot.  You explained this when you were helping me with ecc on the
diskonchip.


>  
>>
>>> Moreover, reading just the OOB region with ECC may require a full page read on some drivers
>>> (when OOB and data are parts of the same codeword).
>>>
>>> To me, the only strong reason for wanting OOB ECC is the implementation of YAFFS2 or similar filesystems
>>> which require OOB metadata protection. But maybe I'm missing some other use cases ?
>>>
>>> What do you think ?
>>
>>
>> If we assume the oob bytes on the first page of a good block can contain
>> anything, won't simply counting the bits make the risk of falsly identifying a
>> bb marker unacceptably high?
> 
> Counting bits on a BBM marker byte basically gives a 4-bitflip protection on a _single_ byte, which is
> *extremely* unlikely. If you assume an erased good block can contain garbage in its OOB region, then
> it can indeed be wrongly identified as a bad block; but this is also true if you use OOB ECC
> (e.g. exceeding correction capacity).
> In practice, since the bad block marker byte is normally never programmed to anything other than 0xff,
> there is no reason why we should find garbage in it (even if a power failure occurs during an
> erase/program operation).


This is what I was missing.  I was assuming that the bb marker byte could be
programmed to an arbitrary value by the user.  I see now that e.g., davinci
defines the bb marker position in its ecc.layout definition, so it will never be
written as long as MTD_OPS_AUTO_OOB mode is used.  I need to fix that in the docg4.

Are you trying to gently nudge me on this? :)  I am loathe to touch that bbm
code.  OTOH, the docg4 would benefit, since it uses an oob bb marker.

Thanks again Ivan,
Mike
