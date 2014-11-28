Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuIBU-0005ng-KY
 for linux-mtd@lists.infradead.org; Fri, 28 Nov 2014 09:49:53 +0000
Received: by mail-wi0-f179.google.com with SMTP id ex7so10643599wid.12
 for <linux-mtd@lists.infradead.org>; Fri, 28 Nov 2014 01:49:29 -0800 (PST)
Message-ID: <54784527.8060205@gmail.com>
Date: Fri, 28 Nov 2014 10:49:27 +0100
From: Angelo Dureghello <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBI 1MiB size partition
References: <5472F403.50702@gmail.com>
 <1417167595.11181.5.camel@sauron.fi.intel.com>
In-Reply-To: <1417167595.11181.5.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Artem,

thanks for your reply.

> UBI is a volume manager which is designed to manage the entire flash
> chip. Sometimes system designers have one or two small partitions at the
> beginning of the chip, and give the rest to UBI.
>
> You are using NAND flash, and UBI tries to reserve some amount of
> eraseblocks for bad block handling. And the count of eraseblocks to
> reserve is calculated from the entire chip size. So UBI says it wants
> 20, but reserved only 4 - all the available blocks you have. So you do
> not have any more blocks left, so you have no space.
>
> You really should re-think your design. 1MiB partition is too small,
> there are too few eraseblocks. What if one or two of them become bad?
>
Yes, i realized this. A redesign of the partition scheme is needed at this
stage.
I cannot actually change the partition scheme for some reasons connected
to the production process, but at least things are more clear now.

Regards,
Angelo
