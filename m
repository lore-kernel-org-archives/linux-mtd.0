Received: from ug-out-1314.google.com ([66.249.92.173])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7ZLB-000345-MT
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 11:06:03 -0400
Received: by ug-out-1314.google.com with SMTP id u40so811056ugc
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Jul 2006 08:05:53 -0700 (PDT)
Message-ID: <625fc13d0607310805i1d13877fj12e37607be038212@mail.gmail.com>
Date: Mon, 31 Jul 2006 10:05:52 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@wohnheim.fh-wedel.de>
Subject: Re: BUG: missing get_mtd_device when running cat /dev/mtdblock*
In-Reply-To: <20060731142615.GB16710@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20060731142615.GB16710@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/31/06, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
> While debugging on a 2.6.5 kernel (with fairly recent mtd) I noticed
> that mtdblock appears to be bypassing get_mtd_device().

Yes, it bypasses calling that.  But...

> Can anyone verify this on current mtd by adding a simple printk() to
> get_mtd_device() and running cat /dev/mtdblock0 > /dev/null or so?
>
> I am assuming this is not desired behaviour and should get fixed.

It seems mtd_blkdevs.c handles the reference counting itself.  See
blktrans_open.  Most certainly this could be changed to call
get_mtd_device instead, but I believe all the locking is correct as it
stands.

Might want to double check though.

josh
