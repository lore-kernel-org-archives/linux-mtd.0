Message-ID: <54E22168.7070703@free-electrons.com>
Date: Mon, 16 Feb 2015 13:57:12 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
References: <1424091072-7738-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
 <20150216172753.5e92739a@free-electrons.com>
 <20150216164134.GE25269@lukather>
In-Reply-To: <20150216164134.GE25269@lukather>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On 02/16/2015 01:41 PM, Maxime Ripard wrote:
> On Mon, Feb 16, 2015 at 05:27:53PM +0100, Thomas Petazzoni wrote:
>> Dear Maxime Ripard,
>>
>> On Mon, 16 Feb 2015 13:51:11 +0100, Maxime Ripard wrote:
>>
>>> +		while (index < (len * 4)) {
>>> +			u32 timeout;
>>> +
>>> +			__raw_readsl(info->mmio_base + NDDB, data + index, 8);
>>
>> Are you guaranteed that 'len' is a multiple of 32 bytes?
> 
> I don't know if you're guaranteed of anything, but the controller
> supports only 512, 2k, 4k and 8k pages, which are all mutiples of 32
> bytes.
> 

'len' here comes from:

do_bytes = min(info->data_size, info->chunk_size);

and

DIV_ROUND_UP(do_bytes, 4)

Where chunk_size is the size we want to read/write in each command step
(keep in mind that with extended commands we issue multiple commands, and
read/write data in chunks for each page).

And data_size is initialized at mtd->writesize (i.e. the size of a page).

Given all the flash pages I'm aware of are multiples of 32-bytes, and
given a chunk is either a quarter or half a page... I'd say it's
guaranteed to be 32-byte multiple, but perhaps it's a good idea to enforce it.
- -- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU4iFfAAoJEIOKbhOEIHKiOuMQAK0yiPyjBKRcqX8qrpG9Ljcq
JVhJTjn7VdiWhoh0n9BOt5bV3K0wAvcbt3LZvpGwf1EOifBaZB+f2QskZNLDUXyC
JXPaonbdUqabEU0n9frduc9xBgbPhrwL4X0RzbJ0xZ+A2FrPt/80qUe8lsDmykH9
dyl3FOL3EQQiQ83D1VefkYbeDjaunvhA7Lfi7CcdPSFRv1FE47NQUW/8OjvZVczx
uPcvdNj4818aXtFyOJQbR9xWOhVh7nxPlU8flHZPHuJ5WVCGWBbt++/4vmK+LZkv
aZQ8W6dGiKI3ayT+PQ7nsETmoXZcjWTihq+nW+Ie2vs5PZf1iME5RYarLSKsc0Ac
4GjLnd4+0H3jeInvJ0MLw0dhkYM4PLkzp4CPo4vrH8z5F3cLXxaRkZYuv7gChden
C2VITr9C8p1OSQJ2mF8m9gWdExkEuuy7q6vURx74C4KaeQA2R4ARAROm85o6JtmN
dhozZIFrJQGwGuB5+7MI3yJj4OpFsBkxoq6U1JNDTwYnu3SnMOdwvq9kwqGXgR2I
yQlu6MO6DYHkMtmw//kkqX+vnyhGexrFoesOyG4d40mOgyGYqyk+oadV7pNh2g5Y
nXGr21Li80N65Sk+RaOFlvmIPaQ45Xn6gS7ckHcVVCZI9HAu87n5n15HEtfaj4Dc
r9FkTUgw9cqcio5EVfEs
=nkDF
-----END PGP SIGNATURE-----
