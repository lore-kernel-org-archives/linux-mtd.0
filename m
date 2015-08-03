Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZM6Av-0007P7-NX
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 03:12:30 +0000
Date: Mon, 3 Aug 2015 11:12:10 +0800
From: Eryu Guan <eguan@redhat.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: fstests@vger.kernel.org, dedekind1@gmail.com, richard.weinberger@gmail.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/5] xfstest: generic/125 add _require_odirect
Message-ID: <20150803031210.GP17933@dhcp-13-216.nay.redhat.com>
References: <1438236417-24612-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438236417-24612-4-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438236417-24612-4-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2015 at 02:06:55PM +0800, Dongsheng Yang wrote:
> generic/125 is using src/trunc which is testing O_DIRECT.
> So we have to add direct dependence to this test.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

Reviewed-by: Eryu Guan <eguan@redhat.com>

> ---
>  tests/generic/125 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/generic/125 b/tests/generic/125
> index bcf9b3e..67eb63f 100755
> --- a/tests/generic/125
> +++ b/tests/generic/125
> @@ -41,6 +41,7 @@ _supported_os Linux
>  
>  _require_test
>  _require_user
> +_require_odirect
>  
>  TESTDIR=$TEST_DIR/ftrunc
>  TESTFILE=$TESTDIR/ftrunc.tmp
> -- 
> 1.8.4.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe fstests" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
