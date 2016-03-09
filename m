Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adh7K-00015l-D9
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 16:37:47 +0000
Subject: Re: [PATCH 1/2] mtd: nand: use a lower value for badblockbits when
 working with MLC NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF69672@NTXXIAMBX02.xacn.micron.com>
 <20160309152638.0b5e9250@bbrezillon>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
From: Andrea Scian <rnd4@dave-tech.it>
Message-ID: <56E0513D.5000508@dave-tech.it>
Date: Wed, 9 Mar 2016 17:37:17 +0100
MIME-Version: 1.0
In-Reply-To: <20160309152638.0b5e9250@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Il 09/03/2016 15:26, Boris Brezillon ha scritto:
> On Tue, 1 Mar 2016 14:47:21 +0000
> Bean Huo 霍斌斌 (beanhuo) <beanhuo@micron.com> wrote:
>
>> Hi, Andrea and Boris
>> This is a historical subject, and talked before.
>>  From our field issues, 8 bits of bad block mark for MLC NAND is not reasonable.
>> Because of bitflip on bad block mark, regard one good block as a bad block is common
>> Issue. Especially first time boot after reflow. The solution is modified this value to 4 for MLC
>> NAND by hand, and the factory BB mark is “0x00”.
>> I think, 4 bits for MLC NAND make sense.
>
>
> I'm tempted to say "let's start with this value and see what happens in
> real world". If we want to be a bit more conservative we could decide
> to chose 2, which should address most problems too (during my tests, I
> never seen such a huge concentration of bitflips in the same byte).
>
> Brian, Andrea, what do you think?
>

I'm currently using 4 on my custom kernel.
On all datasheet I've seen factory bad block marker is 0x00 and the same 
is (AFAIK) used by MTD to mark bad blocks.

Kind Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems
