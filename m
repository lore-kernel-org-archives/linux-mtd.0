Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnWpj-0004j3-F0
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 13:13:04 +0000
Received: by bwz13 with SMTP id 13so5228577bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 06:13:02 -0700 (PDT)
Subject: Re: MTD Flash Partition: change possible?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTinWcL_wQWCudD5sk=hHmKn8kYk7=+CS-t4OGSc-@mail.gmail.com>
References: <AANLkTikgBKD4yku0fF_WaatNaOsRWwPf-VLKrWXByk1a@mail.gmail.com>
	<1282560805.24044.5.camel@localhost>
	<AANLkTikc13g+5Q3YFMhgfJ1LWq_aMLUK1M9AFr2G1WSP@mail.gmail.com>
	<1282565622.24044.20.camel@localhost>
	<AANLkTinWcL_wQWCudD5sk=hHmKn8kYk7=+CS-t4OGSc-@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Aug 2010 16:11:31 +0300
Message-ID: <1282569091.24044.38.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-23 at 15:09 +0200, Arno Steffen wrote:
> If I check the git for mtd-utils, this pathes seems not to be
> inserted. Do I have to patch manually?
> http://git.infradead.org/mtd-utils.git

Yes.

> Calculating the address might work, but hasn't to be. It is not
> forbidden to have "holes" in the partition table.

OK. Then I think you can introduce a sysfs attribute like:

/sys/class/mtd/mtd0/start

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
