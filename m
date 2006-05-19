Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FgtAD-0005eL-K3
	for linux-mtd@lists.infradead.org; Thu, 18 May 2006 20:48:37 -0400
Received: by ug-out-1314.google.com with SMTP id q2so616954uge
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 May 2006 17:48:20 -0700 (PDT)
Message-ID: <625fc13d0605181741o555494ceg392a72f415c3132b@mail.gmail.com>
Date: Thu, 18 May 2006 19:41:38 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Charles Manning" <manningc2@actrix.gen.nz>
In-Reply-To: <200605190943.03913.manningc2@actrix.gen.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <200605190943.03913.manningc2@actrix.gen.nz>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Why are there 2 oobinfos for a NAND mtd?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/18/06, Charles Manning <manningc2@actrix.gen.nz> wrote:
> There are both mtd->oobinfo and
> ((struct nand_chip *)mtd->priv)->autooob.
>
> There's even a memcpy from one to the other. If they're supposed to be th=
e
> same all the time, surely there should only be one of these?
>
> They both get used in nand_base, which is perhaps wrong. For example,
> nand_read_ecc() uses mtd->oobinfo and nand_do_read_ecc() uses the other o=
ne.
>
> Having two gets confusing and I have seen drivers where one has been  hac=
ked
> one but not the other  which has lead to inconsistencies and faailures.
>
> Is there any valid reason to have two?

I have no idea, but I do know that Thomas plans for some oob cleanup
soon.  Perhaps this is on his list.

josh
