Received: from mail-eopbgr30139.outbound.protection.outlook.com
 ([40.107.3.139] helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQxot-00039l-4d
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 14:54:42 +0000
Subject: Re: On-die ECC support
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <45d6eb07-d6f0-1ac1-bd50-ef913a2826d8@axentia.se>
 <a00bb5bf-abdb-ce5f-e644-492b54d348c5@nod.at>
From: Peter Rosin <peda@axentia.se>
Message-ID: <2679512d-6646-18c0-d000-494642d66f32@axentia.se>
Date: Tue, 10 Jan 2017 15:54:12 +0100
MIME-Version: 1.0
In-Reply-To: <a00bb5bf-abdb-ce5f-e644-492b54d348c5@nod.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017-01-09 22:46, Richard Weinberger wrote:
> Peter,
> 
> Am 09.01.2017 um 22:37 schrieb Peter Rosin:
>> Hi!
>>
>> AFAICT, on-die ECC support [1] (continues in [2]) was never upstreamed
>> and the patches no longer applies. I wonder if someone has done the
>> work to forward port them to recent kernels?
> 
> Nope.
> 
> Supporting On-die ECC in a proper way is with the current MTD NAND code
> not possible.

Hmm, has something fundamental changed since the patches were proposed
that makes it impossible? Or is it just the same as it was a couple of
years ago, but different mechanics (changes to layout handling etc)?

> I stopped working on it since I have no longer access to working
> On-die ECC hardware and On-die ECC is a dead horse.

Maybe so, but here I am with a desire to use a new kernel with old
hardware...

> It is slow and no longer available for recent NANDs.

Cheers,
peda
