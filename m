Received: from marmot.wormnet.eu ([2a03:9800:10:2d:3203:b3a5:8bdc:5b68])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UKpjG-00089n-3d
 for linux-mtd@lists.infradead.org; Wed, 27 Mar 2013 12:45:23 +0000
In-Reply-To: <CALF0-+W0L_6=+Ee0rE=0HdnbzQBR3zobow7bERXdVqmT+Q93vw@mail.gmail.com>
References: <1364124453-899-1-git-send-email-alex@digriz.org.uk>
 <CALF0-+W0L_6=+Ee0rE=0HdnbzQBR3zobow7bERXdVqmT+Q93vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mtd: plat_nand: add further DT bindings and documentation
From: Alexander Clouter <alex@digriz.org.uk>
Date: Wed, 27 Mar 2013 12:44:16 +0000
To: Ezequiel Garcia <elezegarcia@gmail.com>
Message-ID: <d72797f5-5e6f-4986-8cf9-31e4e947303e@email.android.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <elezegarcia@gmail.com> wrote:

>Hi Alexander,
>
>On Sun, Mar 24, 2013 at 8:27 AM, Alexander Clouter <alex@digriz.org.uk>
>wrote:
>> The plat_nand driver has some devicetree support but it is currently
>> unusable, especially as there is no documentation on how to use it.
>>
>> This patch adds the much needed documentation as well as adds some
>common
>> properties (bank-width, chip-delay, bbt-use-flash and nr-chips)
>removing
>> further use of the platform_nand_data struct.
>>
>> Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
>> ---
>>  .../devicetree/bindings/mtd/plat-nand.txt          |   93
>++++++++++++++++++++
>>  drivers/mtd/nand/plat_nand.c                       |   53
>++++++++---
>>  2 files changed, 134 insertions(+), 12 deletions(-)
>>  create mode 100644
>Documentation/devicetree/bindings/mtd/plat-nand.txt
>>
>
>What's the difference between this patch, and the one you've sent
>before with the same patch commit message?

Nothing....same patch.  Bare DT support was added to plat-nand, this fixes the woes devs have if they try to use that DT functionality.
-- 
Alexander Clouter
