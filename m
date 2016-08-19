Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1balHG-0004aq-IA
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 15:00:11 +0000
Received: by mail-wm0-x243.google.com with SMTP id i138so3737619wmf.3
 for <linux-mtd@lists.infradead.org>; Fri, 19 Aug 2016 07:59:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160804210747.GN10383@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-5-git-send-email-kdasu.kdev@gmail.com>
 <20160804210747.GN10383@sirena.org.uk>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Fri, 19 Aug 2016 10:59:47 -0400
Message-ID: <CAC=U0a3sDaiwRhAEZW0u_itaD7o3oUTRAEdDi_O3r9yZSr+cjA@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] mtd: m25p80: Let m25p80_read() fallback to spi
 transfer
To: Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>
Cc: linux-spi@vger.kernel.org, MTD Maling List <linux-mtd@lists.infradead.org>,
 vigneshr@ti.com, Florian Fainelli <f.fainelli@gmail.com>,
 "Jayachandran C <jchandra@broadcom.com>,
 bcm-kernel-feedback-list" <bcm-kernel-feedback-list@broadcom.com>,
 Vikram Prakash <vikram.prakash@broadcom.com>,
 Andy Fung <andy.fung@broadcom.com>, Jon Mason <jon.mason@broadcom.com>,
 "Jayachandran C <jchandra@broadcom.com>,
 bcm-kernel-feedback-list" <jchandra@broadcom.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding Brian for this particular patch since its in the mtd domain. I
will specifically  add him as well in the next  patch set.  I do have
Vignesh in the list who added the spi_flash_read() in the list.

Kamal

On Thu, Aug 4, 2016 at 5:07 PM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jul 29, 2016 at 06:13:09PM -0400, Kamal Dasu wrote:
>> In m25p80_read() even though spi_flash_read() is supported
>> by some drivers, under certain circumstances like unaligned
>> buffer, address or address range limitations on certain SoCs
>> let it fallback to core spi reads. Such drivers are expected
>> to return -EAGAIN so that the m25p80_read() uses standard
>> spi transfer.
>
> You need to send this to the MTD maintainers, I see you've CCed the list
> but not Brian and any comaintainers he has AFAICT.
