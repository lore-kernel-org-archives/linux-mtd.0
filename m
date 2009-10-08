Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MvlNT-0007LF-5p
	for linux-mtd@lists.infradead.org; Thu, 08 Oct 2009 05:17:27 +0000
Subject: Re: [PATCH 1/3]: mtdoops: Make page size configurable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091002160609.3a164ef5@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091002160609.3a164ef5@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Oct 2009 08:17:13 +0300
Message-Id: <1254979033.3359.21.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd <linux-mtd@lists.infradead.org>,
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

On Fri, 2009-10-02 at 16:06 +0200, Simon Kagstrom wrote:
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
> ---
>  drivers/mtd/mtdoops.c |   62 ++++++++++++++++++++++++++----------------------
>  1 files changed, 34 insertions(+), 28 deletions(-)

Would be nice to have better commit messages which describes why you
need this option.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
