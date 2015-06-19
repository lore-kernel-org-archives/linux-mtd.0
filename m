Message-ID: <55842B51.6000507@toshiba.co.jp>
Date: Fri, 19 Jun 2015 23:46:41 +0900
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] mtd: nand: support for Toshiba BENAND (Built-in ECC
 NAND)
References: <1434038402-26365-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <CAFLxGvzSosfd50=UUcSRgjiVw=48FP8hgxb9bhL9UDGHTBz9yw@mail.gmail.com>
 <558025B7.3030103@toshiba.co.jp> <55802A44.6040708@nod.at>
In-Reply-To: <55802A44.6040708@nod.at>
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

> Please see my patches how to deal with that. Maybe you can find a better solution.

Thank you for your suggestion. I considered to use your submitted patch on BENAND
driver, but I believe reading twice the same page approach will affect read performance.
Additionally, BENAND does not support Disable ECC. So, I cannot use same approach.

I consider other solutions.

BENAND Read Status CMD (70h) can report Rewrite Recommend. BENAND also has extended
ECC Status CMD (7Ah). This can report number of bit error / sector data.
If I can use an extended ECC Status CMD (7Ah) in BENAND driver (nand_benand.c),
I suggest to implement it as the follows:

+++ b/drivers/mtd/nand/nand_benand.c
     .....

+/* ECC Status Read Command */
+#define NAND_CMD_ECC_STATUS 0x7A
     .....
+	chip->ecc.strength = 8;
     .....
+            /* correctable */
+            else if (status & NAND_STATUS_RECOM_REWRT) {
+                          if (chip->cmd_ctrl &&
+                                        IS_ENABLED(CONFIG_MTD_NAND_BENAND_ECC_STATUS)) {
+
+                                        /* Check Read ECC Status */
+                                        chip->cmd_ctrl(mtd, NAND_CMD_ECC_STATUS,
+                                                      NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
+                                        ecc_status = chip->read_byte(mtd);
+                                        bitflips = ecc_status & 0xff;
+                                        mtd->ecc_stats.corrected += bitflips;


If above implementation cannot be acceptable, I would like to use "mtd->bitflip_threshold"
to inform number of bitflip, as the follows:

+                          } else {
+                                        /*
+                                        * If can't use chip->cmd_ctrl,
+                                        * we can't get real number of bitflips.
+                                        * So, we set bitflips mtd->bitflip_threshold.
+                                        */
+                                        bitflips = mtd->bitflip_threshold;
+                                        mtd->ecc_stats.corrected += bitflips;
+                          }
+            }
+
+            return bitflips;
+}

-- Yoshi

On 2015/06/16 22:53, Richard Weinberger wrote:
> Am 16.06.2015 um 15:33 schrieb KOBAYASHI Yoshitake:
>>>> +       /* correctable */
>>>> +       else if (status & NAND_STATUS_RECOM_REWRT) {
>>>> +               pr_info("BENAND : Recommended to rewrite!\n");
>>>> +               bitflips = chip->ecc.strength;
>>>
>>> In your case this might be okay, as you set strength to 1.
>>> Otherweise you'd have to report the real number of bitflips.
>>
>> I also thought it is okay in this case.
>> BENAND return corrected data to Host NAND Controller till uncorrectable status.
>> The current patch uses this Read Status command 70h to abstract BENAND Multi
>> bit ECC and Need to Rewrite judgement so BENAND would look like 1bit ECC device.
>
> The layers above MTD need to know how many bits got repaired.
> It seems like BENAND suffers from the same shortcomings than On-Die-ECC. ;-\
> Please see my patches how to deal with that. Maybe you can find a better solution.
>
> Thanks,
> //richard
>
>
>
