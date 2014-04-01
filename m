Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUtH1-0001Iy-T8
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 07:38:20 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, David Mosberger
 <davidm@egauge.net>
Subject: RE: [PATCH v4 4/5] mtd: nand: Allocate extra buffers needed for
 on-die ECC controller.
Date: Tue, 1 Apr 2014 07:37:46 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EABA125@DBDE04.ent.ti.com>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-5-git-send-email-davidm@egauge.net>
 <20140401072815.GC6400@brian-ubuntu>
In-Reply-To: <20140401072815.GC6400@brian-ubuntu>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "gsi@denx.de" <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>>On Mon, Mar 31, 2014 at 05:28:56PM -0600, David Mosberger wrote:
[...]
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index dbb99b3..456809b 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -533,6 +533,8 @@ struct nand_buffers {
>>  	uint8_t	*ecccalc;
>>  	uint8_t	*ecccode;
>>  	uint8_t *databuf;
>> +	uint8_t *chkbuf;
>> +	uint8_t *rawbuf;
>
>Do you really need two additional buffers? Can you get by with just one
>of them?
>

Some similar comments have been provided in the previous versions
of the patch. But due to in-consistency in $subject, they might not
be visible as a thread of same discussion.
You may like to review and comment on below threads also.


[PATCH] mtd: nand: Add support for Micron on-die ECC controller (rev2).
http://lists.infradead.org/pipermail/linux-mtd/2014-March/052949.html

[RFC] mtd: nand: Preparatory patch for adding on-die ECC controller support=
 ...
http://lists.infradead.org/pipermail/linux-mtd/2014-March/052969.html


with regards, pekon
