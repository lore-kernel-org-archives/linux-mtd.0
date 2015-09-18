Received: from mail-oi0-f53.google.com ([209.85.218.53])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zd1go-0000vL-AE
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 19:51:23 +0000
Received: by oibi136 with SMTP id i136so32292098oib.3
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2015 12:51:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMZO5Bf6QjNVa1W=8ognoWRnG2Ct2W8Xs4++-7OMOLR6dikiA@mail.gmail.com>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAOMZO5Bf6QjNVa1W=8ognoWRnG2Ct2W8Xs4++-7OMOLR6dikiA@mail.gmail.com>
Date: Fri, 18 Sep 2015 15:51:00 -0400
Message-ID: <CA+-FG62+vpJiuxNegEDd6sZ7oqfcrv_EWqa4skuoSXWzM-Ea3g@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Roshni Shah <roshni.shah@timesys.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabio,

I haven't tried 4.2 or 4.3-rc1 on this custom board. However, I have
tried 4.1-rc5 on Vybrid TWR (same NOR chip, qspi interface, Vybrid
processor as the custom board) and I saw the same issues as described
in the first post.

if there are specific fixes in 4.2 or 4.3-rc1, I could try them on
both them on the custom board / Vybrid TWR board.  Let me know.

Thanks,
Roshni

On Fri, Sep 18, 2015 at 2:19 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Fri, Sep 18, 2015 at 1:50 PM, Roshni <roshni.shah@timesys.com> wrote:
>> Hi,
>>
>> I have a custom board based on Freescale Vybrid Platform with a SPI-NOR
>> flash S25fl128s (16MiB). When using UBIFS on this flash part, I see
>> corruptions after UBIFS is mounted. See error/further below:
>>
>> What could be the cause of these corruptions? Any pointers / help will be
>> greatly appreciated.
>>
>> Thanks a lot,
>> Roshni
>>
>> Kernel Version - 3.13
>
> Does the problem also happen on 4.2 or 4.3-rc1?
