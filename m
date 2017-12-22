Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSQcA-00061B-Ff
 for linux-mtd@lists.infradead.org; Fri, 22 Dec 2017 16:56:08 +0000
Received: by mail-pf0-x22a.google.com with SMTP id d23so15511066pfe.9
 for <linux-mtd@lists.infradead.org>; Fri, 22 Dec 2017 08:55:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171222165308.10f2fe15@xps13>
References: <20171221231904.21140-1-chris.packham@alliedtelesis.co.nz>
 <20171221231904.21140-2-chris.packham@alliedtelesis.co.nz>
 <20171222165308.10f2fe15@xps13>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 22 Dec 2017 13:55:54 -0300
Message-ID: <CAAEAJfDzZJKVX+3f69o0UF6DgcQEW-UEmp-VG9bPkFd2dybYkQ@mail.gmail.com>
Subject: Re: [PATCHv4 1/1] mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370
 variants
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
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

On 22 December 2017 at 12:53, Miquel RAYNAL
<miquel.raynal@free-electrons.com> wrote:
> Hello Chris,
>
> On Fri, 22 Dec 2017 12:19:04 +1300
> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
>
>> From: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
>>
>> The Armada-370 based SoCs support arbitration between the NAND Flash
>> interface and NOR (i.e. devbus) on the same chip select. However there
>> are two guidelines that must be followed to avoid data corruption in
>> this scenario.
>
> Sorry to bother you again with that but, do you actually face any
> issue/data corruption with this scenario?
>

Indeed. We need a description of a real world problem this patch is fixing.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
