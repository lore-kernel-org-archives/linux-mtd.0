Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dMyjB-000598-EQ
 for linux-mtd@lists.infradead.org; Mon, 19 Jun 2017 15:36:36 +0000
Subject: Re: 4-bits ECC correction
To: Danesh Daroui <Danesh.Daroui@ascom.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <39BC08CB3FF4C84CB6397533D4FC79097E94EE06@SEGOTEXCH02.ascom-Resource.ads>
 <CAFLxGvw7OSL=WWaxbyXR0mCWCkqjUKU0=4-BDrnvmuZ42bnSUA@mail.gmail.com>
 <39BC08CB3FF4C84CB6397533D4FC79097E94EE69@SEGOTEXCH02.ascom-Resource.ads>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5b38d3c9-3d83-02c3-5dc6-cfd29e980a01@nod.at>
Date: Mon, 19 Jun 2017 17:36:05 +0200
MIME-Version: 1.0
In-Reply-To: <39BC08CB3FF4C84CB6397533D4FC79097E94EE69@SEGOTEXCH02.ascom-Resource.ads>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Danesh,


Am 19.06.2017 um 16:55 schrieb Danesh Daroui:
> Thanks a lot for your answer.
> 
> Is there any document about how can we use software ECC with at least level 4 (4-bit ECC) or how it can be activated in the kernel? Also, is there any possible way to know what level of ECC is currently used by UBI/UBIFS or the NAND flash hardware itself?

UBI/UBIFS does not not ECC. The NFC or the Linux NAND core does.
See Documentation/devicetree/bindings/mtd/nand.txt on setting the ECC mode.

> What kind of incompatibility might occur? We are using quite old kernel (2.6.39.4) so would it be possible to use software ECC on this kernel as well or we need to update the kernel first 

Well, your bootloader has to implement Software ECC exactly the same way as Linux does.
Sorry, I don't remember when we merged software BCH.

Thanks,
//richard
