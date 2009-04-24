From: "Singh, Vimal"
	<IMCEAEX-_O=TI_OU=BD_CN=RECIPIENTS_CN=X0094262@dlee86.itg.ti.com>
To: "dedekind@infradead.org" <dedekind@infradead.org>
Date: Fri, 24 Apr 2009 13:57:57 +0530
Subject: RE: [resending][PATCH] [MTD] [NAND] nand_ecc.c: Bug fix in nand ecc
Message-ID: <19F8576C6E063C45BE387C64729E739404321C6027@dbde02.ent.ti.com>
References: <34437.192.168.10.89.1238579632.squirrel@dbdmail.itg.ti.com>
	,<1238580110.20906.73.camel@localhost.localdomain>
	,<19F8576C6E063C45BE387C64729E73940427A869F3@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739404321C6025@dbde02.ent.ti.com>,
	<1240558797.22645.1.camel@localhost.localdomain>
In-Reply-To: <1240558797.22645.1.camel@localhost.localdomain>
Content-Language: en-US
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Frans, Meulenbroeks <fransmeulenbroeks@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 24, 2009 at 1:09 PM, Artem Bityutskiy <dedekind@infradead.org> =
wrote:
> Hi,
>
> On Fri, 2009-04-24 at 12:02 +0530, Singh, Vimal wrote:
>> It looks like Frans is not active to this list, now a days...
>> so can some one else review this patch:
>> http://lists.infradead.org/pipermail/linux-mtd/2009-April/025094.html
>
>
> It did not apply. Please, send patches which can be applied.
>
> Please, fix you e-mail. Is your address really
> "IMCEAEX-_O=3DTI_OU=3DBD_CN=3DRECIPIENTS_CN=3DX0094262@dlee86.itg.ti.com"=
 ?
>
> But I fixed both - your patch and your e-mail. Please, check your other
> patches and re-send them if they are corrupted. Please, take a look at
> Documentation/SubmittingPatches
>
> I've amended your patch a little. Instead of using 'uint32_t', I
> made it to be 'int'. I do not see any reason to limit the compiler
> and CPU by 32 bits. I do not appreciate unreasonable usage of these
> 'uint32_t' and similar types, and I think 'int' is perfectly fine

I agree to not limit it to 32bit. But Then I will prefer to use 'unsigned i=
nt'
rather just 'int', since 'byte_addr' is always a positive number.

> in your case. Could you please verify this? It is here:
> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git?a=3Dcommit;h=3De3b=
8cec094d12aabbfd77c462b1932537e1c239e

I still do not see this change in commit, this is still 'uint32_t'.

Thanks and Regards,
vimal

>
> Thanks!
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=
