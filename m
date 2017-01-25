Received: from mail-yb0-f195.google.com ([209.85.213.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWJWh-0001UZ-Ls
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 09:06:01 +0000
Received: by mail-yb0-f195.google.com with SMTP id 123so14321623ybe.0
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jan 2017 01:05:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <3304d64f-38aa-1a3c-0b5d-edb493abd61a@hauke-m.de>
References: <1484904834-14980-1-git-send-email-sebtx452@gmail.com>
 <3304d64f-38aa-1a3c-0b5d-edb493abd61a@hauke-m.de>
From: Seb <sebtx452@gmail.com>
Date: Wed, 25 Jan 2017 10:04:37 +0100
Message-ID: <CA+hF=GdKLEN2ue=Q7KpBp+W+bTnj5O_OAoPjuDOScga2efnjPA@mail.gmail.com>
Subject: Re: [PATCH] mtd: maps: lantiq-flash: Check if the EBU endianness swap
 is enabled
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-mtd@lists.infradead.org, linux-mips@linux-mips.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,


> I would prefer to use a device tree option to activate this check and
> only access LTQ_EBU_BUSCON0 when this property is set.

If I understand correctly, I have to make something like this :

---

bool mtd_addr_swap=true;

        if (!of_machine_is_compatible("lantiq,falcon") &&
                of_find_property(pdev->dev.of_node,
"lantiq,ebu_swap_check", NULL))
                if (ltq_ebu_r32(LTQ_EBU_BUSCON0) & EBU_FLASH_ENDIAN_SWAP)
                        mtd_addr_swap = false;

---

And then set this property directly on my device-specific dts file ?
