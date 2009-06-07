Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDFWv-0008JJ-Lp
	for linux-mtd@lists.infradead.org; Sun, 07 Jun 2009 10:23:16 +0000
Subject: Re: Confuse with WL_THRESHOLD
From: Artem Bityutskiy <dedekind@infradead.org>
To: Thang Dao Duy <hanbaoquansexy@gmail.com>
In-Reply-To: <a1fb7300906051703p148c5d1k7fd46257c8031ac6@mail.gmail.com>
References: <a1fb7300906022244g5cd882acw7de4b9b0ecc35547@mail.gmail.com>
	<a1fb7300906051703p148c5d1k7fd46257c8031ac6@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 07 Jun 2009 13:23:00 +0300
Message-Id: <1244370180.5847.322.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-06-06 at 07:03 +0700, Thang Dao Duy wrote:
> Hi everyone.
> I used NANDsim and ubifs not for along time. Now, I have confused with
> wear-leveling threshold. If i give parameter WL_THRESHOLD in Kernel is
> small (example, the value is  3), then when i write a file size 2 MiB
> to NAND about 200 times, it makes me cannot read EC and VID headers of
> one PEB (example PEB 10). May be that PEB is bad ? And when i set the
> WL_THRESHOLD is higher (the value is 20), i write a file 2MiB about
> 1000 times, nothing 's happen, i can read headers of any PEB. So can
> you tell me what make this happen, and show me where in ubi source in
> kernel.

Looks like a bug. Please, describe precisely how to reproduce it,
and I'll take a look at this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
