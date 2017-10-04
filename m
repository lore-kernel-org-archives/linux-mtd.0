Received: from us-smtp-delivery-107.mimecast.com ([216.205.24.107])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzhUk-0001VR-C0
 for linux-mtd@lists.infradead.org; Wed, 04 Oct 2017 11:05:44 +0000
Subject: Re: [PATCH v2 0/2] mtd: nand: wait for tWHR, and fix the
 setup_data_interface of Denali
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
CC: linux-mtd <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, LKML <linux-kernel@vger.kernel.org>, Marek
 Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Mason <slash.tmp@free.fr>
References: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
 <20170929142635.07d55f77@bbrezillon>
 <CAK7LNASiker+1_uHXyhdkSJVMCX-TwXLhxD_ibQFLXWR9u0p6w@mail.gmail.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <e96ba107-9636-715d-7d53-fa79e0890a3d@sigmadesigns.com>
Date: Wed, 4 Oct 2017 13:05:11 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNASiker+1_uHXyhdkSJVMCX-TwXLhxD_ibQFLXWR9u0p6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29/09/2017 16:33, Masahiro Yamada wrote:

> (+CC Marc Gonzalez)
>=20
> 2017-09-29 21:26 GMT+09:00 Boris Brezillon <boris.brezillon@free-electron=
s.com>:
>> On Fri, 29 Sep 2017 19:38:38 +0900
>> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>>
>>> 1/2 : add NAND_WAIT_TWHR and nand_whr_delay().
>>>       You can set this new flag if you want nand_command(_lp)
>>>       to insert tWHR delay where needed.
>>>
>>> 2/2 : Fix Denali setup_data_interface.
>>>       Boris' suggestion in v1 was a good reminder that
>>>       made me realize tCCS was missing in the driver.  Fix it now.
>>>
>>>
>>> Changes in v2:
>>>   - Add nand_whr_delay() helper
>>>     Wait for tWHR only for drivers that explicitly set NAND_WAIT_TWHR f=
lag
>>>   - newly added
>>>
>>> Masahiro Yamada (2):
>>>   mtd: nand: wait for tWHR after NAND_CMD_STATUS / NAND_CMD_READID
>>
>> Hm, I thought you were introducing this to then use it in the denali
>> driver. Sorry, but I don't want to apply something that nobody needs.
>> If someone ever complains about a missing delay I'll point him to your
>> patch, but until then I'll keep the core unchanged.
>=20
> Perhaps, Marc Gonzalez is the person.
>=20
>=20
> tango_nand.c is the only driver that sets NAND_WAIT_TCCS.
>=20
> Now, there is completely no delay when reading out the ID.
>=20
>=20
> One safe change might be apply this patch,
> then set NAND_WAIT_TWHR to tango_nand.c
>=20
>=20
> I am guessing NAND_WAIT_TCCS was added for it.
> Theoretically, I do not see logical difference between tCCS and tWHR.
>=20
> I am CCing Marc Gonzalez, the author of tango_nand.c

Hello Masahiro,

I remember having issues reading the ONFI ID when I was writing
the driver, a year ago. Sometimes, the first few bytes appeared
to be missing. This looked like a timing issue.

Adding the dev_ready call-back solved the problem. Do you think
that was by accident? When I have more time, I will test the 4.14
branch, to see if there are any issues with the current driver.

Regards.
