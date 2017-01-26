Received: from mail-yb0-f194.google.com ([209.85.213.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWhpv-0007vq-7k
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2017 11:03:28 +0000
Received: by mail-yb0-f194.google.com with SMTP id f67so4410103ybc.3
 for <linux-mtd@lists.infradead.org>; Thu, 26 Jan 2017 03:03:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <0DAF21CFE1B20740AE23D6AF6E54843F1E6F607C@IRSMSX101.ger.corp.intel.com>
References: <1484904834-14980-1-git-send-email-sebtx452@gmail.com>
 <3304d64f-38aa-1a3c-0b5d-edb493abd61a@hauke-m.de>
 <CA+hF=GdKLEN2ue=Q7KpBp+W+bTnj5O_OAoPjuDOScga2efnjPA@mail.gmail.com>
 <0DAF21CFE1B20740AE23D6AF6E54843F1E6F607C@IRSMSX101.ger.corp.intel.com>
From: Seb <sebtx452@gmail.com>
Date: Thu, 26 Jan 2017 12:02:04 +0100
Message-ID: <CA+hF=GcW2W6T08BZYXoZQcpe=+QuPp0H7kT2ci+6Td-ZZL+ouQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: maps: lantiq-flash: Check if the EBU endianness swap
 is enabled
To: "Langer, Thomas" <thomas.langer@intel.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas


> No, please avoid "of_machine_is_compatible" in drivers.

OK


> We should introduce specific compatible strings for this driver, which trigger this,
> e.g. "lantiq,nor-vr9" or "lantiq,nor-ar10" (or better using family names "xrx200" and "xrx300")

You mean we can use the same way as other drivers, for example in the
physmap_of_versatile.c file :

static const struct of_device_id syscon_match[] = {
        {
                .compatible = "arm,integrator-ap-syscon",
                .data = (void *)INTEGRATOR_AP_FLASHPROT,
        },
        {
                .compatible = "arm,integrator-cp-syscon",
                .data = (void *)INTEGRATOR_CP_FLASHPROT,
        },

etc...


We can't filter on xrx200 or vr9, but we have to know the VR9 version
(as the VR9 < 1.2 is not compatible with this patch).

Regards,

Sebastien
