Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTabo-00069m-6w
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 17:30:25 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Gerhard Sittig <gsi@denx.de>
Subject: RE: [PATCH] mtd: nand: Add support for Micron on-die ECC controller
 (rev2).
Date: Fri, 28 Mar 2014 17:27:51 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB9761@DBDE04.ent.ti.com>
References: <1395875121-9320-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
 <20140327112722.GQ3998@book.gsilab.sittig.org>
 <20980858CB6D3A4BAE95CA194937D5E73EAB9500@DBDE04.ent.ti.com>,
 <20140328124313.GB3998@book.gsilab.sittig.org>
In-Reply-To: <20140328124313.GB3998@book.gsilab.sittig.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: David Mosberger <davidm@egauge.net>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
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

Hi Gerhard,=0A=
[...]=0A=
=0A=
>> >when "on die ECC" is enabled, the chip requires a sequence of=0A=
>> >- read page command (READ0, addresses, READSTART)=0A=
>> >- status check (mandatory! cmd 70, to check FAIL and REWRITE bits)=0A=
>> >- re-enter data read mode (READ0, _without_ addresses and START)=0A=
>> >- fetch data bytes=0A=
>> >=0A=
>> I checked Micron Datasheet for "MT29F4G16ABADAWP by name=0A=
>> "m60a_4gb_8gb_16gb_ecc_nand.pdf" and on its=0A=
>> "Figure 39: READ PAGE (00h-30h) Operation with Internal ECC Enabled"=0A=
>> There is no mention of above third step.=0A=
>>=0A=
>> As per the "figure 39" a READ_PAGE Operation with internal ECC enabled=
=0A=
>> requires following sequence..=0A=
>> - [00h] <address> <address> ... <address> [30h]  /* READ_PAGE command */=
=0A=
>> - [70h] <status> [00h]        /* READ_STATUS command */=0A=
>> And after that data comes our serial on the bus. So in that case you can=
=0A=
>=0A=
>They cheat. :)  You'll only notice when you look closely, I=0A=
>misread this stuff too at first.  The Micron datasheet uses=0A=
>different terms than the MTD implementation in Linux does.=0A=
>=0A=
>Their "READ_PAGE" command, referred to as 00-30, actually is in=0A=
>Linux the "READ0 command (0x00) and READSTART command (0x30)"=0A=
>sequence.  (I'd like to see them as sequences or aggregates of=0A=
>existing commands, instead of even more commands that happen to=0A=
>re-use other command's opcodes, which I feel is confusing.)=0A=
>=0A=
Yes, I think its correctly implemented in nand_command_lp()=0A=
(Kindly cross check if I misunderstood below)=0A=
=0A=
For chip->cmd(mtd, NAND_CMD_READ0, column, page);=0A=
=0A=
@@nand_command_lp(..)=0A=
(Step-1) : Sends READ0 =3D=3D [00h]=0A=
         /* Command latch cycle */=0A=
	chip->cmd_ctrl(mtd, command, NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);=0A=
=0A=
(Step-2): Sends <column-address> .. <page-address>=0A=
        if (column !=3D -1) {=0A=
        ...=0A=
        }=0A=
        if (page !=3D -1) {=0A=
        ...=0A=
        }=0A=
=0A=
(Step-3): Send READ_START =3D=3D [30h]=0A=
                switch (command) {=0A=
                ...=0A=
                case NAND_CMD_READ0:=0A=
                         chip->cmd_ctrl(mtd, NAND_CMD_READSTART,=0A=
			          NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);=0A=
                         chip->cmd_ctrl(mtd, NAND_CMD_NONE,=0A=
			          NAND_NCE | NAND_CTRL_CHANGE);=0A=
                }=0A=
=0A=
So, I think nand_command_lp() follows the sequence as per Micron device.=0A=
As it has been working for normal nand_reads also.=0A=
=0A=
=0A=
>The above "70 status 00" actually is "STATUS (command 70 and a=0A=
>status byte) plus READ0 (command 00)".  Not re-emitting the READ0=0A=
>(this time without the addresses and READSTART) would make you=0A=
>fetch more status bytes instead of the cached data bytes.=0A=
>=0A=
Yes, this is why I said ("this may require some tweaks").=0A=
So, actually you can modify nand_command_lp()=0A=
- to add new command =3D NAND_CMD_END_STATUS which just issues [00h],=0A=
- OR modify existing NAND_CMD_STATUS to do something similar.=0A=
=0A=
But I think for most of the command sequences nand_command_lp()=0A=
can be re-used, if not then please improve it.=0A=
=0A=
with regards, pekon=
