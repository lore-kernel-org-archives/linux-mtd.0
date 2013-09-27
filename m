Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPRXo-00086k-AW
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 06:28:52 +0000
Message-ID: <5245256F.1060407@ti.com>
Date: Fri, 27 Sep 2013 11:57:59 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCHv2] drivers: mtd: devices: Add quad read support.
References: <1380191565-28640-1-git-send-email-sourav.poddar@ti.com>
 <1380193243.28494.51.camel@i7.infradead.org> <524418AF.3030306@ti.com>
 <5244F003.6040502@freescale.com> <52451D85.90404@ti.com>
 <524522A7.2090202@freescale.com>
In-Reply-To: <524522A7.2090202@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: artem.bityutskiy@linux.intel.com, balbi@ti.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 27 September 2013 11:46 AM, Huang Shijie wrote:
> 于 2013年09月27日 13:54, Sourav Poddar 写道:
>> On Friday 27 September 2013 08:10 AM, Huang Shijie wrote:
>>> 于 2013年09月26日 19:21, Sourav Poddar 写道:
>>>> If the pupose of LUT is to just set the dummy cycles, and vf610-twr
>>>> hardware state machine does not have have any other dependency
>>>> on LUT, this patch should work.
>>> Hi Sourav & David:
>>>
>>>    The key issue about the vf610-twr is that:
>>>    [0] Use the LUT makes the Quadspi driver more efficiency.
>>>    [1] the vf610-twr needs to know the SPI NOR commands for Page 
>>> Program.
>>>        Why? because the driver can not change the size of 
>>> write-buffer from 256bytes to the 64byte(TXFIFO SIZE).
>> Not clear about this. But, you will anyway know what you are using 
>> from the m25p80 side rite?
>
>  The TX FIFO is 64 bytes in the Vybrid, but the Page Program may 
> writes 265 bytes per time.
>
>  If the TX FIFO is smaller then the size of Page Program, we have to 
> wait until the Write(64bytes) is finished.
>  If we do not wait, the write will not finished.
>
>
hmm..I think thats should be handle in your controller by checking 
t->tx_buf and see what command is used.
>
>>>    [2] the dummy and other things.
>>>
>> Dummy stuffs can be handled from m25p80 side rite? fast read dummy 
>> cycle support is already there. While,
>> $subject patch adds it for quad read.
> The m25p80 can only handle the 8bit dummy now, such as fast read and 
> QOR(0x6b).
>
> But it can not handle the QIOR (0XEB, may needs 4bit dummy), and can 
> not handle the DDR QIOR(0XED, may
> needs 6bit dummy).
>
Correct, as I explained in one of my comment on v1, that the creating of 
a quad api is justified for this reason itself, since
there are other quad commands wth different dummy cycle requirements. We 
can build on top of $subject patch and try
to add support for other quad commands also. ?
> thanks
> Huang Shijie
>
