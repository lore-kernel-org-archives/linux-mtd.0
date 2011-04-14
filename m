Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QALeg-0004ns-E3
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 12:28:15 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3ECSCYZ014262
	for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2011 15:28:12 +0300
Subject: Re: [PATCHv1 2/5] serve_image: adjust type for printf
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
In-Reply-To: <865774bea767bf615bbaf79139448aef65d55202.1302700658.git.ext-andriy.shevchenko@nokia.com>
References: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<865774bea767bf615bbaf79139448aef65d55202.1302700658.git.ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 15:25:15 +0300
Message-ID: <1302783915.2796.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-04-13 at 16:20 +0300, Andy Shevchenko wrote:
>  	if (st.st_size % erasesize) {
>  		fprintf(stderr, "Image size %ld bytes is not a multiple of erasesize %d bytes\n",
> -			st.st_size, erasesize);
> +			(long)st.st_size, erasesize);

Same here.


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
