Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5GkL-00020L-8X
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 12:13:05 +0000
Received: by wwb39 with SMTP id 39so1925356wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Mar 2011 05:13:04 -0700 (PDT)
Subject: Re: Perf issue with UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bhavesh Parekh <bhaveshparekh1@gmail.com>
In-Reply-To: <AANLkTik9KDEkVT59CqyMM2NUFeBAiAcN_WrnRLqbzaOD@mail.gmail.com>
References: <AANLkTin4FHcpvhsQJkU7pOUPk3-gV+N+1cb0W6_3KC8P@mail.gmail.com>
	<1299587464.2754.27.camel@localhost>
	<AANLkTik_-ZAau27j+7r5EbGyNiPPCH_9a0o9M_H9fsXb@mail.gmail.com>
	<1299764095.6676.22.camel@localhost>
	<AANLkTik9KDEkVT59CqyMM2NUFeBAiAcN_WrnRLqbzaOD@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 15:10:44 +0300
Message-ID: <1301573444.2828.52.camel@localhost>
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

On Thu, 2011-03-17 at 15:14 +0530, Bhavesh Parekh wrote:
> Thanks Artem.
> Patches you mention helped alot. Now the perf is almost same as that
> of YAFFS2.
> 
> I think there will be changes require in the root-fs creation
> tool(ubinize) as well to support the writebufsize. Correct ?

No, I do not think so.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
