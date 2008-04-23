Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Joa6h-0001CL-G7
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 08:13:35 +0000
Message-ID: <480EEFAB.7010304@parrot.com>
Date: Wed, 23 Apr 2008 10:13:31 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind@infradead.org>, Bruce_Leonard@selinc.com,
	Nancy <nancydreaming@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC] slight UBI scan time improvement
References: <1208882552.11721.13.camel@sauron>
	<20080423073840.GA9472@cloud.net.au>
In-Reply-To: <20080423073840.GA9472@cloud.net.au>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hamish Moffatt wrote:
> On Tue, Apr 22, 2008 at 07:42:32PM +0300, Artem Bityutskiy wrote:
>> Hi,
>>
>> I've prepared 2 UBI patches which may slightly improve the scan time. I
>> am not sure though. Would you guys please try them and tell if UBI scan
>> time changed? Thanks in advance.
> 
> Hi Artem,
> 
> Thanks for your patch.. unfortunately I don't see a significant
> difference, although it is slightly faster.
> 
> Before:
> 
> [    0.950000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
> [    0.960000] Scanning device for bad blocks
> [    1.000000] Bad eraseblock 494 at 0x03dc0000
> [    1.050000] Bad eraseblock 1300 at 0x0a280000
> [    1.140000] Bad eraseblock 2554 at 0x13f40000
> [    1.160000] Bad eraseblock 2923 at 0x16d60000
> [    1.200000] Bad eraseblock 3349 at 0x1a2a0000
> [    1.230000] Bad eraseblock 3790 at 0x1d9c0000
> [    6.900000] UBI: attached mtd9 to ubi0
> 
> After:
> 
> [    0.950000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
> [    0.960000] Scanning device for bad blocks
> [    1.000000] Bad eraseblock 494 at 0x03dc0000
> [    1.050000] Bad eraseblock 1300 at 0x0a280000
> [    1.140000] Bad eraseblock 2554 at 0x13f40000
> [    1.160000] Bad eraseblock 2923 at 0x16d60000
> [    1.200000] Bad eraseblock 3349 at 0x1a2a0000
> [    1.230000] Bad eraseblock 3790 at 0x1d9c0000
> [    6.890000] UBI: attached mtd9 to ubi0
> 
> 
> 
> Hamish

Do you know when the bad block scanning finish and the ubi scan start ?


Matthieu
