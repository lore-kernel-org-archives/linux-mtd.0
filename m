Received: from mail-yk0-x235.google.com ([2607:f8b0:4002:c07::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ztiei-0001jn-0N
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 20:58:12 +0000
Received: by ykba4 with SMTP id a4so37721889ykb.3
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2015 12:57:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151103215424.40169dd4@bbrezillon>
References: <5638E074.5070800@ge.com>
 <CAAEAJfAjs0k26QumQdDzHeMGAM2s=xJw4E8N+yhs5GMCFkK=Aw@mail.gmail.com>
 <20151103212546.0184eaf6@bbrezillon>
 <20151103204511.GI7274@google.com>
 <20151103215424.40169dd4@bbrezillon>
Date: Tue, 3 Nov 2015 12:57:51 -0800
Message-ID: <CAN8TOE81jrY7szTkcgqTqUjxXdqEdXgeFhZFkCpJPG9orXox5w@mail.gmail.com>
Subject: Re: nand_flash_detect_onfi error
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Renaud Barbier <renaud.barbier@ge.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 3, 2015 at 12:54 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 3 Nov 2015 12:45:11 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
>
>> On Tue, Nov 03, 2015 at 09:25:46PM +0100, Boris Brezillon wrote:
>> > On Tue, 3 Nov 2015 13:56:16 -0300
>> > Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>> > > On 3 November 2015 at 13:27, Renaud Barbier <renaud.barbier@ge.com> wrote:
>> > > > chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
>> > > > for (i = 0; i < 3; i++) {
>> > > >         for (j = 0; j < sizeof(*p); j++)
>> > > >                 ((uint8_t *)p)[j] = chip->read_byte(mtd);
>> > > >         if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
>> > > >                         le16_to_cpu(p->crc)) {
>> > > >                 break;
>> > > >         }
>> > > > }
>> > > >
>> ...
>> > BTW, I wonder why ->read_byte() is used instead of ->read_buf() here.
>>
>> commit bd9c6e99b58255b9de1982711ac9487c9a2f18be
>> Author: Brian Norris <computersforpeace@gmail.com>
>> Date:   Fri Nov 29 22:04:28 2013 -0800
>>
>>     mtd: nand: don't use read_buf for 8-bit ONFI transfers
>
> Makes sense. Thanks for pointing this out.

Perhaps it was worth a code comment. It can be confusing.
