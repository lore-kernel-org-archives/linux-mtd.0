Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xhs4M-0000Jo-WE
 for linux-mtd@lists.infradead.org; Sat, 25 Oct 2014 03:31:12 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so2231692pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 24 Oct 2014 20:30:49 -0700 (PDT)
Message-ID: <544B194B.1090409@gmail.com>
Date: Sat, 25 Oct 2014 11:30:19 +0800
From: Zhou Wang <wangzhou.bry@gmail.com>
MIME-Version: 1.0
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
References: <1414073085-19296-1-git-send-email-wangzhou.bry@gmail.com>
 <1414073085-19296-2-git-send-email-wangzhou.bry@gmail.com>
 <CAN1soZz8NYxppaY4cXadqynERZ=6ZRAynDtptGAps+yUJZ0Qsw@mail.gmail.com>
In-Reply-To: <CAN1soZz8NYxppaY4cXadqynERZ=6ZRAynDtptGAps+yUJZ0Qsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 pawel.moll@arm.com, ijc+devicetree@hellion.org.uk,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xuwei \(O\)" <xuwei5@hisilicon.com>, wangzhou1@hisilicon.com,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 galak@codeaurora.org, caizhiyong@huawei.com,
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

On 2014年10月24日 19:46, Haojian Zhuang wrote:
> On Thu, Oct 23, 2014 at 10:04 PM, Zhou Wang <wangzhou.bry@gmail.com> wrote:
>> Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
>> ---
>>   drivers/mtd/nand/Kconfig        |    5 +
>>   drivers/mtd/nand/Makefile       |    1 +
>>   drivers/mtd/nand/hisi504_nand.c |  836 +++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 842 insertions(+)
>>   create mode 100644 drivers/mtd/nand/hisi504_nand.c
>>
>
> I think that you need to run scripts/checkpatch.pl. There're some
> warnings reported on this patch.
>
Hi Haojian,

I will run the checkpatch.pl again and fix the warnings.
But for lines like this:
+	if (host->command == NAND_CMD_ERASE1)
+		host->addr_value[0] |= ((page_addr >>16) & 0xff) << 16;
+	else
+		host->addr_value[1] |= ((page_addr >> 16) & 0xff);
Only over 80 for some characters in one line, it will report a warning.
Can I just leave the warning there for the tidy of the code?

>> +
>> +       case NAND_CMD_SEQIN:
>> +               host->offset = column;
>> +
>
> It's better not using waterfall style. Maybe you can write it clearly.
>              case NAND_CMD_SEQIN:
>                      host->offset = column;
>                      set_addr(mtd, column, page_addr);
>                      break;
Thanks, I will modify the code like this above.
>
>> +       chip->ecc.mode = of_get_nand_ecc_mode(np);
>> +       /* read ecc-bits from dts */
>> +       of_property_read_u32(np, "hisi,nand-ecc-bits", &host->ecc_bits);
>
> Do you need to check the ecc_bits at here? Maybe user inputed the
> wrong ecc_bits in DTS.
Yes, it is better to check the ecc_bits here, thanks for your reminding.

Best regards,
Zhou Wang
>
> Best Regards
> Haojian
>
