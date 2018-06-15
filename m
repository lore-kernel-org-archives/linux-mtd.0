Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTj7I-0003N0-Lv
 for linux-mtd@lists.infradead.org; Fri, 15 Jun 2018 07:25:54 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: "Sourabh Jain (R&D - Telecom)" <sourabh.jain@matrixcomsec.com>,
 "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBIFS node corruption issue
Date: Fri, 15 Jun 2018 09:25:39 +0200
Message-ID: <11266688.7aeLSOnTp9@blindfold>
In-Reply-To: <CAAR3sxPDGVtdTkWD23GOdqB_BAp0EACOoSUeq8zAjWB5JYSsAA@mail.gmail.com>
References: <d03e8f457821494f951fabac2933bbfe@SIWEX5A.sing.micron.com>
 <CAFLxGvz7W372kQq0xZnHRgXZpSyDKB7UhSAVEJ65FCmKS4hR3A@mail.gmail.com>
 <CAAR3sxPDGVtdTkWD23GOdqB_BAp0EACOoSUeq8zAjWB5JYSsAA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 15. Juni 2018, 09:19:46 CEST schrieb Sourabh Jain (R&D - Telecom):
> We did not enabled the xattr in the ubifs filesystem in kernel configuration.

Ok.
 
> Also, we had kept a setup with integck utility of mtd-utils to stress
> test ubifs. In this case, we found a separate error of "corrupt empty
> space at some index LEB". Due to this, the mtd partition was not
> mount.
> So, in which portion (UBIFS, UBI Driver, MTD drivers or NAND Driver?)
> we should work to resolve this problem?

At the MTD layer. In recent kernels we made sure that MTD drivers don't
report ECC errors to UBI when an empty page has bitflips.

See gpmi-nand.

Thanks,
//richard


-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
