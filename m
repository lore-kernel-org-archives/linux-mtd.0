Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRpAc-0003LV-Kt
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 15:16:27 +0000
From: "Singh, Vimal"
	<IMCEAEX-_O=TI_OU=BD_CN=RECIPIENTS_CN=X0094262@dlee86.itg.ti.com>
To: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
Date: Fri, 17 Jul 2009 20:42:16 +0530
Subject: RE: [PATCH v3 1/3] mtd-nand: Add "page" parameter to all
	read_page/read_page_raw APIs
Message-ID: <19F8576C6E063C45BE387C64729E739404321C6107@dbde02.ent.ti.com>
References: <42655.192.168.10.89.1247812404.squirrel@dbdmail.itg.ti.com>,
	<7A436F7769CA33409C6B44B358BFFF0C011E71798F@dlee02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739404321C6106@dbde02.ent.ti.com>,
	<7A436F7769CA33409C6B44B358BFFF0C011E7179CB@dlee02.ent.ti.com>
In-Reply-To: <7A436F7769CA33409C6B44B358BFFF0C011E7179CB@dlee02.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>, "Paulraj,
	Sandeep" <s-paulraj@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 17, 2009 at 8:18 PM, Narnakaje, Snehaprabha<nsnehaprabha@ti.com=
> wrote:
>> -----Original Message-----
>> From: Singh, Vimal
>> Sent: Friday, July 17, 2009 10:45 AM
>> To: Narnakaje, Snehaprabha
>> Cc: linux-mtd@lists.infradead.org; davinci-linux-open-
>> source@linux.davincidsp.com; dwmw2@infradead.org; tglx@linutronix.de;
>> akpm@linux-foundation.org; Paulraj, Sandeep
>> Subject: RE: [PATCH v3 1/3] mtd-nand: Add "page" parameter to all
>> read_page/read_page_raw APIs
>>
>> > > Why not just adding 'page' or 'cur_page' parameter to 'mtd_info'
>> structure and
>> > > populate the same in 'nand_do_read_ops' and 'nand_do_write_ops' as
>> soon as you
>> > > calculate 'page' for every read and write access respectivily. And
>> then this
>> > > info can be used by any one who has knowledge of 'mtd_info'.
>> > >
>> > Yes, that was one option. This meant, some of the existing handlers fo=
r
>> read_oob and write_oob required changes to get rid of "page", if we deci=
de
>> to use the page from mtd_info structure.
>>
>> But that would have taken less changes.
>
> The change in read_oob/write_oob handlers would be minimal.
>
> But the API definitions should change all over the place, similar to the =
way read_page API had to change in all NAND files (in this patch).

AFAIK 'drivers/mtd/nand/cafe_nand.c' is only driver which over rides read_o=
ob/write_oob APIs.

-vimal=
