Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMtPz-00066j-Ni
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 04:01:28 +0000
Received: by lagy4 with SMTP id y4so1259031lag.36
 for <linux-mtd@lists.infradead.org>; Tue, 24 Apr 2012 21:01:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5280156.KyNjAmSTh8@avalon>
References: <1334913230-23615-1-git-send-email-hechtb@gmail.com>
 <CABYn4sx4SehvwHgP3m5i5Bg7_5FWTHHGMLL+n_R1YujwaU_MzA@mail.gmail.com>
 <CABYn4sxbXiOkdPps59gkOj2MiYZXkeqgKTXt7i7HTz17VqWk0Q@mail.gmail.com>
 <5280156.KyNjAmSTh8@avalon>
Date: Tue, 24 Apr 2012 21:01:25 -0700
Message-ID: <CAN8TOE9oAbLPSSO5P+U=DJk_vhjF0DgM0mBO7QyYE7zAOwbnmw@mail.gmail.com>
Subject: Re: [PATCH 8/9] mtd: sh_flctl: Use user oob data in hardware ECC mode
From: Brian Norris <computersforpeace@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Magnus Damm <magnus.damm@gmail.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Bastian Hecht <hechtb@googlemail.com>, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 24, 2012 at 2:33 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday 23 April 2012 11:36:29 Bastian Hecht wrote:
>> 2012/4/23 Bastian Hecht <hechtb@googlemail.com>:
>> > 2012/4/21 Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
>> >> On Friday 20 April 2012 11:13:49 Bastian Hecht wrote:
>> >>> In hardware ecc mode, the flctl now writes and reads the oob data
>> >>> provided by the user. Additionally the ECC is now returned in normal
>> >>> page reads, not only when using the explicit NAND_CMD_READOOB command.
>> >>
>> >> For my information again, what's the purpose of returning OOB data if the
>> >> caller hasn't requested it ? What are those data then used for ?
>> >
>> > There is an active discussion going on whether to pass a boolean to
>> > nand_{read,write} that indicates if we need oob data or not. I assume
>> > this to make it into the mainline then I can adapt this to the flctl
>> > driver. The data can be used by file systems or bad block marking or
>> > any other organizational needs like wear leveling and so on.
>>
>> I'm unsure if I missed your point here - we just don't know if we need
>> it or not. The discussion I mentioned primarily takes place here at
>> the mtd mailing list:
>
> My point was just that it was pointless to read/write OOB data if the caller
> doesn't use them. It's an optimization: reading OOB data won't hurt regardless
> of what the caller does with it, but it will use CPU time and power for no
> reason. Adding an OOB argument to the {read,write}_page function would make
> this explicit.

Right, it is pointless and should be changed fairly soon, if my
patches go through. But until the additional argument is added, you
cannot guarantee that the interface wasn't expecting both data+OOB to
be read. For instance, the mtd_read_oob interface may call
nand_do_read_ops() with non-null datbuf and oobbuf. We have just such
a case in mtdswap.c and nand_bbt.c, I think. See Shmulik's comments
here (some of which only apply to mtd_write_oob):

http://lists.infradead.org/pipermail/linux-mtd/2012-April/040800.html

Brian
