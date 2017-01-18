Received: from mail-yw0-x22a.google.com ([2607:f8b0:4002:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTtmh-0005a8-W5
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2017 17:12:33 +0000
Received: by mail-yw0-x22a.google.com with SMTP id l19so12424395ywc.2
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2017 09:12:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <845374ff-62b0-983b-b399-4965421a9066@phrozen.org>
References: <1484741452-27141-1-git-send-email-sebtx452@gmail.com>
 <e5bb2245-a0d0-5b66-2c75-9af26c6ea846@phrozen.org>
 <CA+hF=GeD0dhBUkR+wR_35pSXgSnU0kW6EfYWa9h2QrGOTReMnA@mail.gmail.com>
 <845374ff-62b0-983b-b399-4965421a9066@phrozen.org>
From: Seb <sebtx452@gmail.com>
Date: Wed, 18 Jan 2017 18:12:09 +0100
Message-ID: <CA+hF=Gc5ZBLqo65fbchZeqtyEUgH-kdqpf8i3A-Z5nFTt58a4A@mail.gmail.com>
Subject: Re: [PATCH] mtd: maps: lantiq-flash: Check if the EBU endianness swap
 is enabled
To: John Crispin <john@phrozen.org>
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

> the bug is also fixed on the 300 and 500 series chips, so we would want
> to check for that aswell.
>

I added this to the begin of "ltq_mtd_probe" function:

bool mtd_addr_swap;

        if ( ltq_ebu_r32(LTQ_EBU_BUSCON0) & EBU_ENDIAN_SWAP ) {
                switch (ltq_soc_type()) {
                        case SOC_TYPE_VR9_2 :
                        case SOC_TYPE_AR10 :
                                mtd_addr_swap = false;
                                break;
                        default :
                                mtd_addr_swap = true;
                }
        } else mtd_addr_swap = true;


It's easier to add other architectures as needed. I tried it on my
OpenWrt release, and got it working fine. Is it correct in this way ?
