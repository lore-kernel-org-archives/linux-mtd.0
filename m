Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0TiS-0002Fp-UV
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 06:31:06 +0000
Received: by bwz19 with SMTP id 19so5415217bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Sep 2010 23:31:03 -0700 (PDT)
Subject: Re: [PATCH] mtd : add init_size hook for NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
In-Reply-To: <AANLkTi=6zROsDs2zkCJOXJdiPDh53A=x7WXGZKTyHDoO@mail.gmail.com>
References: <1285328063-7982-1-git-send-email-shijie8@gmail.com>
	<1285502719.13050.17.camel@brekeke>
	<AANLkTi=6zROsDs2zkCJOXJdiPDh53A=x7WXGZKTyHDoO@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Sep 2010 09:29:14 +0300
Message-ID: <1285655354.2437.15.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-09-27 at 11:06 +0800, Huang Shijie wrote:
> Hi Artem:
>     I think the new patch is better.
> 
> The new patch will reuse the id_data.
> Even if the additional id byte does not have all the information in
> some case, but other infomation such as manufacture id and device id
> are also useful to the NAND driver.

OK, pushed this one to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
