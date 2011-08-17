Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtYAW-00057x-TX
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 04:55:57 +0000
Received: by iyf13 with SMTP id 13so1157131iyf.16
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 21:55:53 -0700 (PDT)
Subject: Re: [PATCH] mtd: plat_nand: fix `bbt_options' compile error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 17 Aug 2011 07:57:34 +0300
In-Reply-To: <CAN8TOE_DUqzcwQnLQ8TEqoOX3D8Rn1ZxJuSpQbabPfDd83PQUA@mail.gmail.com>
References: <1312827993-19163-1-git-send-email-computersforpeace@gmail.com>
	<1313502412.21711.1.camel@sauron>
	<CAN8TOE_DUqzcwQnLQ8TEqoOX3D8Rn1ZxJuSpQbabPfDd83PQUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313557059.2679.6.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, axel.lin@gmail.com,
	avorontsov@ru.mvista.com, linux-mtd@lists.infradead.org,
	Linux Kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-08-16 at 15:15 -0700, Brian Norris wrote:
> On Tue, Aug 16, 2011 at 6:46 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > Merged this fix with that commit in the l2-mtd-2.6.git tree, thanks!
> 
> I don't see any "merge." Perhaps an oversight on the push?

Yes, fixed.

-- 
Best Regards,
Artem Bityutskiy
