Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a2FIG-0006au-QK
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2015 09:26:17 +0000
Received: by igbxm8 with SMTP id xm8so26975762igb.1
 for <linux-mtd@lists.infradead.org>; Fri, 27 Nov 2015 01:25:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1448525104-20101-1-git-send-email-zajec5@gmail.com>
References: <1448525104-20101-1-git-send-email-zajec5@gmail.com>
Date: Fri, 27 Nov 2015 10:25:55 +0100
Message-ID: <CACna6rxs==Be4Ua_AUuqZgc8ey0DYXrgUOe=7TqxBEEF7AOzKw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: include mtd.h header for struct mtd_info
 definition
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

On 26 November 2015 at 09:05, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wr=
ote:
> So far struct spi_nor was using just a pointer to struct mtd_info so it
> wasn't needed to have it fully defined there. After recent change we
> embed whole struct so we need to include a proper header.
>
> Fixes: 1976367173a4 ("mtd: spi-nor: embed struct mtd_info within struct s=
pi_nor")
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

This may be worth taking as a fix for 4.4. However I'm not aware of
any upstream driver failing to build because of this.

--=20
Rafa=C5=82
