Received: from wr-out-0506.google.com ([64.233.184.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ICynw-0008Pe-TX
	for linux-mtd@lists.infradead.org; Mon, 23 Jul 2007 10:22:33 -0400
Received: by wr-out-0506.google.com with SMTP id 58so1240743wri
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Jul 2007 07:22:31 -0700 (PDT)
Message-ID: <625fc13d0707230722k7a514055m9e18b71f5beba3ce@mail.gmail.com>
Date: Mon, 23 Jul 2007 09:22:27 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Richard Purdie" <rpurdie@openedhand.com>
Subject: Re: [mtd-utils patch 1/2] Add lzo support to mtd-utils
In-Reply-To: <1184079811.6435.55.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1184079811.6435.55.camel@localhost.localdomain>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Josh Boyer <jdub@us.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/10/07, Richard Purdie <rpurdie@openedhand.com> wrote:
> Add LZO support to mtd-utils to generate LZO compressed jffs2 images
>
> Unlike the kernel version, the standard lzo userspace library is used
> along with lzo1x_999_compress rather than the lzo1x_1_compress version
> since better compression ratios can be obtained (at no significant cost
> to decompression time).
>
> Signed-off-by: Richard Purdie <rpurdie@openedhand.com>

Applied.

josh
