Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1au06i-0001XU-L5
 for linux-mtd@lists.infradead.org; Sat, 23 Apr 2016 16:08:33 +0000
Received: by mail-wm0-x236.google.com with SMTP id u206so67261144wme.1
 for <linux-mtd@lists.infradead.org>; Sat, 23 Apr 2016 09:08:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <B0B1E520541A1D4A94F18E49CE1ED63F084CA2DD@EU-MBX-01.mgc.mentorg.com>
References: <B0B1E520541A1D4A94F18E49CE1ED63F084CA2DD@EU-MBX-01.mgc.mentorg.com>
Date: Sat, 23 Apr 2016 13:08:08 -0300
Message-ID: <CAAEAJfBkxvqBAHLQUrmyjPD01yEw2YRrMTu=JhPkA3ZQu3Da9g@mail.gmail.com>
Subject: Re: [RFC] mtd-utils: add support for erase regions
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: "Rotariu, Marian" <Marian_Rotariu@mentor.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

On 21 April 2016 at 11:34, Rotariu, Marian <Marian_Rotariu@mentor.com> wrot=
e:
> Hello all,
>
> For the moment, mtd-utils does not take into consideration erase
> regions, already used in some mtd kernel drivers. The only purpose for
> the ioctl(MEMGETREGIONINFO) is for debugging or for dumping mtd info.
>
> In one of the SoC that I use, there is a flash with multiple sector
> sizes (4KB/64KB) and I mapped multiple config data in the area with 4KB
> sizes for finer granularity. Unfortunately, I cannot use flash_erase or
> any other mtd-utils tool to erase 4K-sectors where the data resides
> because the mtd erasesize is 64KB (the "major"/default erase size for
> the device). Therefore, every time I want to change something small I
> have to delete an entire 64KB space and rewrite the necessary sectors.
>
> I created some patches that add support for erase regions in mtd-utils
> and I thought of sharing them here. Are these modifications of interest
> for the upstream mtd-utils?
>

Yes, this is known issue and it would be great if we can tackle it
somehow.

Thanks,
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
