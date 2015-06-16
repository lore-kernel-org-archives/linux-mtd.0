Message-ID: <558025B7.3030103@toshiba.co.jp>
Date: Tue, 16 Jun 2015 22:33:43 +0900
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: support for Toshiba BENAND (Built-in ECC
 NAND)
References: <1434038402-26365-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <CAFLxGvzSosfd50=UUcSRgjiVw=48FP8hgxb9bhL9UDGHTBz9yw@mail.gmail.com>
In-Reply-To: <CAFLxGvzSosfd50=UUcSRgjiVw=48FP8hgxb9bhL9UDGHTBz9yw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/06/12 18:49, Richard Weinberger wrote:
> On Thu, Jun 11, 2015 at 6:00 PM, KOBAYASHI Yoshitake
> <yoshitake.kobayashi@toshiba.co.jp> wrote:
>> This patch enables support for Toshiba BENAND.
>> BENAND is a SLC NAND solution that automatically generates ECC inside
>> NAND chip.
>>
>> Some of the comments in the following discussion may need to be considerd.
>>    https://lkml.org/lkml/2015/3/25/310
>
> Yep.
>
>> +void nand_benand_init(struct mtd_info *mtd)
>> +{
>> +       struct nand_chip *chip = mtd->priv;
>> +
>> +       pr_info("%s\n", __func__);
>
> Please kill all these prints. Use ftrace to trace function calls.

Okay, I will delete these prints in next patch.

>> +       chip->ecc.size = mtd->writesize;
>> +       chip->ecc.strength = 1;
>
> BENAND can correct only one bit?
> This would explain why you consider it as fast. ;-)

BENAND is able to correct up to 8bit. By issuing Status command 70h for read operation, BENAND
can report three types of ECC operation status (Pass / Fail(uncorrectable) / Recommended to rewrite).
Judgement for Recommended to rewrite is based on internal logic of BENAND.

>> +int nand_benand_status_chk(struct mtd_info *mtd, struct nand_chip *chip)
>> +{
>> +       unsigned int bitflips = 0;
>> +       u8 status;
>> +
>> +       pr_debug("%s\n", __func__);
>> +
>> +       /* Check Read Status */
>> +       chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
>> +       status = chip->read_byte(mtd);
>> +
>> +       /* timeout */
>> +       if (!(status & NAND_STATUS_READY)) {
>> +               pr_info("BENAND : Time Out!\n");
>> +               return -EIO;
>> +       }
>> +
>> +       /* uncorrectable */
>> +       else if (status & NAND_STATUS_FAIL) {
>> +               pr_info("BENAND : Uncorrectable!\n");
>> +               mtd->ecc_stats.failed++;
>> +       }
>> +
>> +       /* correctable */
>> +       else if (status & NAND_STATUS_RECOM_REWRT) {
>> +               pr_info("BENAND : Recommended to rewrite!\n");
>> +               bitflips = chip->ecc.strength;
>
> In your case this might be okay, as you set strength to 1.
> Otherweise you'd have to report the real number of bitflips.

I also thought it is okay in this case.
BENAND return corrected data to Host NAND Controller till uncorrectable status.
The current patch uses this Read Status command 70h to abstract BENAND Multi
bit ECC and Need to Rewrite judgement so BENAND would look like 1bit ECC device.

  -- Yoshi
