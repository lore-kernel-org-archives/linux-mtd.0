Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qsz6i-0003xX-T6
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 15:29:43 +0000
Received: by yic13 with SMTP id 13so3424294yic.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 08:29:37 -0700 (PDT)
Subject: Re: [PATCH] mtd: cafe_nand: register master MTD at most once
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 15 Aug 2011 18:31:13 +0300
In-Reply-To: <1312328310-18003-1-git-send-email-computersforpeace@gmail.com>
References: <CAN8TOE9mWEmS5YJqNrS9OrG=t+emeLcXNpKR1BiZ6VDJW7_c=A@mail.gmail.com>
	<1312328310-18003-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313422279.8691.9.camel@sauron>
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, dsd@laptop.org,
	Jamie Iles <jamie@jamieiles.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-08-02 at 16:38 -0700, Brian Norris wrote:
> This patch addresses a regression where a master MTD object might be
> registered twice if no partitions are found. The initial bug report can
> be seen here:
>     http://lists.infradead.org/pipermail/linux-mtd/2011-July/037086.html
> 
> The regression is caused by:
>     commit 0f7451bea72c64d3f0a47850328d52f0315e2ea6
>     "mtd: cafe_nand.c: use mtd_device_parse_register"

Thanks for the fix! For some reason David missed the last merge window
and did not merge the MTD stuff. So we still have a possibility to fix
the original commit, so I folded this into commit 0f7451bea.

-- 
Best Regards,
Artem Bityutskiy
