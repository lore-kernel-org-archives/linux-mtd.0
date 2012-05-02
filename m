Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPNxM-0002JQ-NF
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 01:02:13 +0000
Received: by yhjj52 with SMTP id j52so127945yhj.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 18:02:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4FA03338.6070009@broadcom.com>
References: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
 <4FA03338.6070009@broadcom.com>
Date: Tue, 1 May 2012 18:02:11 -0700
Message-ID: <CAN8TOE-fd0b678ukiXSnOAs9WK6XPsSR6QnKXjuk+NifRoHqOA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mtd: nand: rework nand_ecc_ctrl interface for OOB
From: Brian Norris <computersforpeace@gmail.com>
To: Jiandong Zheng <jdzheng@broadcom.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 1, 2012 at 12:02 PM, Jiandong Zheng <jdzheng@broadcom.com> wrot=
e:
> On 4/23/2012 1:14 PM, Brian Norris wrote:
>>
>> Brian Norris (2):
>> =A0 mtd: nand: add 'use_oob' argument to NAND {read,write}_page
>> =A0 =A0 interfaces
>> =A0 mtd: nand: nand_base - pass proper 'use_oob' parameter
>>
>> =A0drivers/mtd/nand/bcm_umi_bch.c =A0 =A0 =A0 =A0 | =A0 10 +++--
>> =A0drivers/mtd/nand/bcm_umi_nand.c =A0 =A0 =A0 =A0| =A0 =A02 +-
>> =A0drivers/mtd/nand/nand_base.c =A0 =A0 =A0 =A0 =A0 | =A0 58
>> ++++++++++++++++++++-----------
>>
>> =A0include/linux/mtd/nand.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 11 +++---
>> =A015 files changed, 89 insertions(+), 70 deletions(-)
>>
> I've built and run these successfully on bcmring.
>
> Acked-by: Jiandong Zheng <jdzheng@broadcom.com>

Great, thanks! I've sent a v3 (might not have CC'd you that time) and
will be sending v4 soon. It may be worth testing v3 or v4. Let me know
if you want your Ack's pasted onto any particular patch.

Thanks,
Brian
