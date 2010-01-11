Received: from mail-fx0-f211.google.com ([209.85.220.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUDSf-0007No-9H
	for linux-mtd@lists.infradead.org; Mon, 11 Jan 2010 06:09:13 +0000
Received: by fxm3 with SMTP id 3so11547026fxm.4
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 22:09:07 -0800 (PST)
Subject: Re: Question on partition wise ECC support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nishanth Menon <menon.nishanth@gmail.com>
In-Reply-To: <782515bb1001060642v78e1c482we6612d8cb8ac041c@mail.gmail.com>
References: <782515bb1001060642v78e1c482we6612d8cb8ac041c@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 11 Jan 2010 08:09:04 +0200
Message-Id: <1263190144.30988.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vimal Singh <vimal.newwork@gmail.com>,
	Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-01-06 at 08:42 -0600, Nishanth Menon wrote:
> Hi,
> Just a generic question: for NAND devices, each ECC strategy such as
> 256byte/512byte ecc has tradeoff b/w reliability Vs performance. I
> wonder if we have some mechanism if we can maintain different ECC
> strategy per partition.

I do not think it is possible.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
