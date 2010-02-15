Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nh2HU-0003Pd-6N
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 14:50:41 +0000
Received: by fxm1 with SMTP id 1so5126672fxm.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Feb 2010 06:50:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1266244528.11659.108.camel@localhost>
References: <ce9ab5791002080220n51cd6611iafe09df6370d8dc2@mail.gmail.com>
	<1266244528.11659.108.camel@localhost>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Mon, 15 Feb 2010 20:20:14 +0530
Message-ID: <ce9ab5791002150650x79e40747w7aa345c115356d06@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Adding nand lock/unlock routines.
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: kishorek.kadiyala@gmail.com, Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 15, 2010 at 8:05 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2010-02-08 at 15:50 +0530, Vimal Singh wrote:
>> This version fixes the compilation break reported by Kishore. 1st
>> patch in this series remains untouched.
>>
>> -vimal
>>
>> From a28c230f3bd8fa765f78c0be91370f146e71f670 Mon Sep 17 00:00:00 2001
>> From: Vimal Singh <vimalsingh@ti.com>
>> Date: Wed, 3 Feb 2010 14:32:06 +0530
>> Subject: [PATCH 2/2] Adding nand lock/unlock routines.
>>
>> Adding nand lock / unlock routines. At least 'micron' parts
>> support this.
>>
>> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>
> These look OK to me, except the part where you export them. Why they
> should be exported?

There was an earlier comment (in 1st RFC version of the patch), where
you said probably it is not safer to assign mtd lock and unlock
pointers in 'nand_scan_tail', as not all flashes have this feature.

So, I exported these so that a driver can use these by overwriting mtd
lock and unlock pointers in its probe.



-- 
Regards,
Vimal Singh
