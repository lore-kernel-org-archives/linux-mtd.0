MIME-Version: 1.0
In-Reply-To: <BANLkTimpLKkfSJbeuM6kc7bUE+JybTmVrA@mail.gmail.com>
References: <1307106198-11965-1-git-send-email-zonque@gmail.com>
	<BANLkTimpLKkfSJbeuM6kc7bUE+JybTmVrA@mail.gmail.com>
Date: Fri, 3 Jun 2011 23:31:06 +0800
Message-ID: <BANLkTik1_cuo5UH995agoNYa2FdQ8Qasiw@mail.gmail.com>
Subject: Re: [PATCH] MTD: pxa3xx_nand: Fix blank page ECC mismatch
From: Lei Wen <adrian.wenl@gmail.com>
To: Daniel Mack <zonque@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <David.Woodhouse@intel.com>, Lei Wen <leiwen@marvell.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	stable@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Also cc to MTD mailist
Cc: linux-mtd@lists.infradead.org

On Fri, Jun 3, 2011 at 11:04 PM, Lei Wen <adrian.wenl@gmail.com> wrote:
> On Fri, Jun 3, 2011 at 9:03 PM, Daniel Mack <zonque@gmail.com> wrote:
>> This bug was introduced in f8155a40 ("mtd: pxa3xx_nand: rework irq
>> logic") and causes the PXA3xx NAND controller fail to operate with NAND
>> flash that has empty pages. According to the comment in this block, the
>> hardware controller will report a double-bit error for empty pages,
>> which can and must be ignored.
>>
>> This patch restores the original behaviour of the driver.
>>
>> Signed-off-by: Daniel Mack <zonque@gmail.com>
>> Cc: Lei Wen <leiwen@marvell.com>
>> Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
>> Cc: David Woodhouse <David.Woodhouse@intel.com>
>> Cc: stable@kernel.org
>> ---
>> =A0drivers/mtd/nand/pxa3xx_nand.c | =A0 =A02 ++
>> =A01 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_na=
nd.c
>> index 0c6ed72..60167d1 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -687,6 +687,8 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_in=
fo *mtd,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * OOB, ignore such double bit errors
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (is_buf_blank(buf, mtd->writesize))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->retcode =3D ERR_NONE=
;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd->ecc_stats.failed++;
>> =A0 =A0 =A0 =A0}
>>
>> --
>> 1.7.5.1
>>
>
> Acked-by: Lei Wen <leiwen@marvell.com>
>
