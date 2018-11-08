Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKcrr-0007Pu-8p
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 05:28:37 +0000
Reply-To: hs@denx.de
Subject: Re: [PATCH 1/2] mkfs.ubifs: Fix IV selection
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at
References: <20181107202108.13734-1-richard@nod.at>
From: Heiko Schocher <hs@denx.de>
Message-ID: <5732008b-d4ee-0ebc-1381-c3d1dfe64297@denx.de>
Date: Thu, 8 Nov 2018 06:28:15 +0100
MIME-Version: 1.0
In-Reply-To: <20181107202108.13734-1-richard@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Hello Richard,

Am 07.11.2018 um 21:21 schrieb Richard Weinberger:
> We need to check for AES being in 128-cbc mode and not 256-cbc.
> fscrypt supports only 128-cbc and 256-xts so far.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>   ubifs-utils/mkfs.ubifs/crypto.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Thanks! Fixes my problems with encryption on imx6 based board.

Tested-by: Heiko Schocher <hsdenx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
