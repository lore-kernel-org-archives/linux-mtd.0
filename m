Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzLUB-0001eA-1W
 for linux-mtd@lists.infradead.org; Fri, 12 Dec 2014 08:22:04 +0000
Message-ID: <548AA590.7060200@nod.at>
Date: Fri, 12 Dec 2014 09:21:36 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Yan Kong <ykong@sierrawireless.com>
Subject: Re: UBI errors when "ls -l"
References: <loom.20141210T102753-582@post.gmane.org>
 <CAFLxGvwqdi6T9zg_QH5Uw3D7R0dUPbX0G-7wDX6p47RBWoSdFw@mail.gmail.com>
 <740E8392C144C64FA5300E5E696A179BB97FEBB16F@carmd-exchmb01.sierrawireless.local>
 <5488498B.4030902@nod.at>
 <740E8392C144C64FA5300E5E696A179BB97FEBB176@carmd-exchmb01.sierrawireless.local>
 <548850C3.8000204@nod.at>
 <740E8392C144C64FA5300E5E696A179BB97FEBB85C@carmd-exchmb01.sierrawireless.local>
In-Reply-To: <740E8392C144C64FA5300E5E696A179BB97FEBB85C@carmd-exchmb01.sierrawireless.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 12.12.2014 um 09:03 schrieb Yan Kong:
> Hi Richard,
> 
> I have ran "mtd_oobtest" for mtd3, failed.....
> (I erase mtd3 before I run the test, by "flash_erase /dev/mtd3 0 0 -N").
> Do you know is it the mtd driver issue or hardware issue?

mtd_oobtest is failing because this test cannot work with your driver
as it does not implement all MTD functions.

Thanks,
//richard
