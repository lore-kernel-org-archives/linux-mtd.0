Received: from wr-out-0506.google.com ([64.233.184.229])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ICyon-0008VD-P3
	for linux-mtd@lists.infradead.org; Mon, 23 Jul 2007 10:23:46 -0400
Received: by wr-out-0506.google.com with SMTP id 58so1240999wri
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Jul 2007 07:23:24 -0700 (PDT)
Message-ID: <625fc13d0707230723o26baf64fr371a104f806ed83@mail.gmail.com>
Date: Mon, 23 Jul 2007 09:23:23 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Richard Purdie" <rpurdie@openedhand.com>
Subject: Re: [mtd-utils patch 2/2] Add favourlzo compression mode
In-Reply-To: <1184079827.6435.56.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1184079827.6435.56.camel@localhost.localdomain>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/10/07, Richard Purdie <rpurdie@openedhand.com> wrote:
> Add a favourlzo compression mode to mtd-utils
>
> This allows lzo compression to be used in the cases where the
> compression ratio isn't quite as good zlib. This can make sense in
> certain use cases because LZO decompression is much faster than zlib.
>
> Signed-off-by: Richard Purdie <rpurdie@openedhand.com>

Applied.

josh
