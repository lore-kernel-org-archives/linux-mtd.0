Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QDC85-0007vH-Iy
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 08:54:22 +0000
Message-ID: <4DB14218.8050708@parrot.com>
Date: Fri, 22 Apr 2011 10:53:44 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
References: <4DB052DB.7040308@parrot.com> <20110421171046.GA790@parrot.com>
	<1303460616.2757.52.camel@localhost>
In-Reply-To: <1303460616.2757.52.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Thu, 2011-04-21 at 19:10 +0200, Ivan Djelic wrote:
>> On Thu, Apr 21, 2011 at 04:52:59PM +0100, Matthieu Castet wrote:
>>> Hi,
>>>
>>> I believe NAND_BBT_SCANBYTE1AND6 behavior is very dangerous.
>>> We have a ST flash where ecc where but on bit 5 and 6.
>>> With new kernel all block are bad.
>>>
>>> Is this option is really needed ?
>>> ST datasheet say [1]. We already check the first Word.
>>> Why do we need to check the 6th Byte ?
>> I agree with Matthieu, NAND_BBT_SCANBYTE1AND6 code also seems wrong to me.
> 
> This just means that we need a better way for drivers to inform the
> generic code about how exactly blocks are marked as bad. Probably
> drivers could describe this with a data structure, and sometimes even
> provide a "is_block_bad()" function.
> 
> The options seem to be not enough.
> 
I think we should also unify bad block scanning.

In the current code bad block scanning could be done by :
- chip->block_bad (default nand_block_bad)
- nand_isbad_bbt


Why nand_isbad_bbt doesn't call chip->block_bad and implement its own scanning
code (scan_block_full or scan_block_fast) ?

This is bad because chip->block_bad can be modified by a driver, but
nand_isbad_bbt won't use it.

Also nand_block_bad and nand_isbad_bbt doesn't use the same scanning pattern.


Matthieu
