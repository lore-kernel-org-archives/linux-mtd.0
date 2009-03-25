Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmQnk-00025d-OI
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 10:57:47 +0000
Message-ID: <49CA0E23.6020701@grandegger.com>
Date: Wed, 25 Mar 2009 11:57:39 +0100
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: "Singh, Vimal" <vimalsingh@ti.com>
Subject: Re: [PATCH v3 1/4] NAND: FSL-UPM: add multi chip support
References: <1237975701-23201-1-git-send-email-wg@grandegger.com>,
	<1237975701-23201-2-git-send-email-wg@grandegger.com>
	<19F8576C6E063C45BE387C64729E73940427A869E0@dbde02.ent.ti.com>
In-Reply-To: <19F8576C6E063C45BE387C64729E73940427A869E0@dbde02.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	Anton Vorontsov <avorontsov@ru.mvista.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Singh, Vimal wrote:
>> +static void fun_select_chip(struct mtd_info *mtd, int chip_nr)
>> +{
>> +       struct nand_chip *chip = mtd->priv;
>> +       struct fsl_upm_nand *fun = to_fsl_upm_nand(mtd);
>> +
>> +       if (chip_nr == -1) {
>> +               chip->cmd_ctrl(mtd, NAND_CMD_NONE, 0 | 
>> NAND_CTRL_CHANGE);
>> +       } else if (chip_nr >= 0) {
>> +               fun->chip_number = chip_nr;
>> +               chip->IO_ADDR_R = chip->IO_ADDR_W =
>> +                       fun->io_base + chip_nr * fun->chip_offset;
>> +       } else {
>> +               BUG();
>> +       }
> braces are not required here...

Really? In the coding style I read:

http://lxr.linux.no/linux+v2.6.29/Documentation/CodingStyle#L171

> 
> 
>> +       prop = of_get_property(ofdev->node, "num-chips", &size);
>> +       if (prop && size == sizeof(uint32_t)) {
>> +               fun->num_chips = *prop;
>> +               if (fun->num_chips >= NAND_MAX_CHIPS) {
>> +                       dev_err(&ofdev->dev, "too much chips");
>> +                       ret = -EINVAL;
>> +                       goto err1;
>> +               }
>> +       } else {
>> +               fun->num_chips = 1;
>> +       }
> ditto...

See above.

Wolfgang.
