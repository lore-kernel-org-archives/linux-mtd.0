Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eJKG8-00017N-TS
 for linux-mtd@lists.infradead.org; Mon, 27 Nov 2017 14:19:51 +0000
Received: by mail-wm0-x230.google.com with SMTP id r68so34665978wmr.3
 for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2017 06:19:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2572889.U5NfXx5rJG@blindfold>
References: <2572889.U5NfXx5rJG@blindfold>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 27 Nov 2017 15:19:20 +0100
Message-ID: <CAAQYJAsndzcGkTMsj_cUeBTyJcAQDV6-d8ZS0=OPH23N2=hTCQ@mail.gmail.com>
Subject: Re: New Defects reported by Coverity Scan for Linux
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 27, 2017 at 2:22 PM, Richard Weinberger <richard@nod.at> wrote:
> Andrea,
>
> please check. The same pattern seems to be used more than once in this dr=
iver.
>
> Thanks,
> //richard

Hello,
I acked the patch v2, considering 2 occurrences:

https://lkml.org/lkml/2017/11/8/567

I thought that was enough, what should I do now?
Thanks
Andrea


P.S.
Neverthless, imho it is impposible to overflow with the numbers we are usin=
g:

+ for (block_num =3D 0; block_num < phymax; block_num++) {
+ block_adr =3D block_num * mtd->erasesize;

#define SHARPSL_FTL_PART_SIZE (7 * SZ_1M)

for pxa25x : nand: 128 MiB, SLC, erase size: 16 KiB, page size: 512,
OOB size: 16
FTL blocks: 448 physical =3D 24 reserved + 424 logical
max block_adr =3D 447 * 16384

for pxa27x
nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
FTL blocks: 56 physical =3D 4 reserved + 52 logical
max block_adr =3D 55 * 131072


>
> ----------  Weitergeleitete Nachricht  ----------
>
> Betreff: New Defects reported by Coverity Scan for Linux
> Datum: Montag, 27. November 2017, 08:49:21 CET
> Von: scan-admin@coverity.com
> An: richard@nod.at
>
>
>
> Hi,
>
> Please find the latest report on new defect(s) introduced to Linux, under
> component 'Drivers-MTD',  found with Coverity Scan.
>
> 1 new defect(s) introduced to Linux, under component 'Drivers-MTD',  foun=
d
> with Coverity Scan.
> 344 defect(s), reported by Coverity Scan earlier, were marked fixed in th=
e
> recent build analyzed by Coverity Scan.
>
> New defect(s) Reported-by: Coverity Scan
> Showing 1 of 1 defect(s)
>
>
> ** CID 1424016:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> /drivers/mtd/parsers/sharpslpart.c: 195 in sharpsl_nand_init_ftl()
>
>
> _________________________________________________________________________=
_______________________________
> *** CID 1424016:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> /drivers/mtd/parsers/sharpslpart.c: 195 in sharpsl_nand_init_ftl()
> 189             /* initialize ftl->log2phy */
> 190             for (i =3D 0; i < ftl->logmax; i++)
> 191                     ftl->log2phy[i] =3D UINT_MAX;
> 192
> 193             /* create physical-logical table */
> 194             for (block_num =3D 0; block_num < phymax; block_num++) {
>>>>     CID 1424016:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
>>>>     Potentially overflowing expression "block_num * mtd->erasesize" wi=
th
> type "unsigned int" (32 bits, unsigned) is evaluated using 32-bit arithme=
tic,
> and then used in a context that expects an expression of type "loff_t" (6=
4
> bits, signed).
> 195                     block_adr =3D block_num * mtd->erasesize;
> 196
> 197                     if (mtd_block_isbad(mtd, block_adr))
> 198                             continue;
> 199
> 200                     if (sharpsl_nand_read_oob(mtd, block_adr, oob))
>
>
> _________________________________________________________________________=
_______________________________
> To view the defects in Coverity Scan visit, https://u2389337.ct.sendgrid.=
net/
> wf/click?
> upn=3D08onrYu34A-2BWcWUl-2F-2BfV0V05UPxvVjWch-2Bd2MGckcRZILrCyVW9WQLwr7wR=
5iGubla-2BOU6Se2Euumsa1bPpOJg-3D-3D_p9c2Pq5BRWXelYclnUuZY8l3SYc-2FPJtx2STX-=
2BpF5A6td-2FPvSZFHfZnIH7Pkuotsj40dgSYlEHnY3fa8hwUfXcZx2zIMi9ygf9fvrncbz9LZ0=
35WDZixEDGKJm-2BkA-2FlNNw4vjG8qChO-2Fsn3KGwsVc2B46OlL-2BawwYWOieMWWWlm44I8p=
x-2BoB-2BuIPoEApB2C1WKE6DZ0qI9OL3nk2Lf6cdMA-3D-3D
>
> To manage Coverity Scan email notifications for "richard@nod.at", click
> https://u2389337.ct.sendgrid.net/wf/click?
> upn=3D08onrYu34A-2BWcWUl-2F-2BfV0V05UPxvVjWch-2Bd2MGckcRbVDbis712qZDP-2FA=
8y06Nq4PW1q5HE7hT0R7FQopI50uMi-2FXxBV9hqQbIHwUk8i5vtfR-2BsAt7Vmc5VhhK-2BFpW=
3LXtshV-2BNRMG6fEVAWxE0JubBijVgPqNmrGAZeWjyxZKc-3D_p9c2Pq5BRWXelYclnUuZY8l3=
SYc-2FPJtx2STX-2BpF5A6td-2FPvSZFHfZnIH7PkuotsjtjhWtoA3IVRL5bV1R9qiwG4cqA-2F=
Ku4HHy-2FY11gvyLcPSbxHkMq75abGzuiZVVK-2BoMEddCyVJkKCXyuwR33GIGAu-2F-2BxMohk=
iXZLfEkTEF4Cq4rSxCKccF8nqIWYFGjwP7kzyOHAH5cWC2z4YWNyegGg-3D-3D
>
>
> -------------------------------------------------------------
