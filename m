Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MwvIO-0000TF-L9
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 10:05:01 +0000
Subject: Re: [PATCH v3 0/3]: mtdoops fixes and improvements
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091008172516.64b5c462@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091008172516.64b5c462@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 13:04:49 +0300
Message-Id: <1255255489.16942.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Aaro Koskinen <aaro.koskinen@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-08 at 17:25 +0200, Simon Kagstrom wrote:
> Hi!
> 
> Here are a couple of patches to mtdoops which I've been working on for
> a while. They should be applied on top of Aaros fix for panic_on_oops.
> That one technically breaks building mtdoops as a module, so I sent a
> patch to LKML which exports panic_on_oops:
> 
>   http://patchwork.kernel.org/patch/52505/

Ah, you already sent it. Sorry, did not read this carefully.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
