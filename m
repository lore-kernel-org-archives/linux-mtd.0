Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL21Y-0005mv-52
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 07:48:02 +0000
Received: by mail-lf0-x244.google.com with SMTP id m17-v6so27685403lfj.8
 for <linux-mtd@lists.infradead.org>; Tue, 22 May 2018 00:47:49 -0700 (PDT)
Subject: Re: [PATCH V2 1/2] dt-bindings: mtd: document Broadcom's BCM47xx
 partitions
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20180509081729.28347-1-zajec5@gmail.com>
Message-ID: <5267836f-7f30-ceb5-14da-93abca3db63b@gmail.com>
Date: Tue, 22 May 2018 09:46:31 +0200
MIME-Version: 1.0
In-Reply-To: <20180509081729.28347-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rob,

On 09.05.2018 10:17, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Broadcom based home router devices use partitions which have to be
> discovered in a specific way. They are not fixed and there is not any
> standard partition table. This commit adds and describes a new custom
> binding for such devices.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> This commit documents a new binding for describing partitions. Just as a
> reminder: we agreed to use "compatible" for that purpose to avoid
> /guessing/. There are too many cases, devices and /formats/ to just
> blindly try every possible parser.
> 
> This was e.g. described by Boris in his patchset 2+ years ago:
> [RFC PATCH 0/7] mtd: partitions: add of_match_table support
> http://lists.infradead.org/pipermail/linux-mtd/2015-December/064076.html
> 
> Quote:
>>   (2) we can't just scan for all supported parsers (like the block system does), since
>>       there is a wide diversity of "formats" (no standardization), and it is not
>>       always safe or efficient to attempt to do so, particularly since many of
>>       them allow their data structures to be placed anywhere on the flash, and
>>       so require scanning the entire flash device to find them.
> 
> I believe this solution was also acked back then by Rob:
> [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
> http://lists.infradead.org/pipermail/linux-mtd/2015-December/064100.html
> 
> V2: Move documentation to the new brcm,bcm947xx-cfe-partitions.txt file
>      as suggested by Rob (we don't want to bloat partition.txt).
>      Slightly update commit message.

I sent this V2 per your request from V1:

On 8 May 2018 at 18:25, Rob Herring <robh@kernel.org> wrote:
 > I guess this is fine. Can you resend as I don't have the original patch.
 >
 > I think it should be a separate file though as partition.txt would
 > become very long if every vendor partitioning was added there.

Would you find a moment to review/nack/ack it, please?
