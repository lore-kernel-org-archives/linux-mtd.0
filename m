Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzJXD-0006dQ-IP
 for linux-mtd@lists.infradead.org; Wed, 26 Oct 2016 08:26:08 +0000
Date: Wed, 26 Oct 2016 11:25:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sheng Yong <shengyong1@huawei.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [bug report] UBI: Fastmap: Do not add vol if it already exists
Message-ID: <20161026082536.GP4418@mwanda>
References: <20161025204607.GA27826@elgon.mountain>
 <58100B0B.3030906@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58100B0B.3030906@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 26, 2016 at 09:46:51AM +0800, Sheng Yong wrote:
> Hi Dan,
> 
> On 10/26/2016 4:46 AM, Dan Carpenter wrote:
> > Hello shengyong,
> > 
> > The patch e96a8a3bb671: "UBI: Fastmap: Do not add vol if it already
> > exists" from May 26, 2015, leads to the following static checker
> > warning:
> > 
> > 	drivers/mtd/ubi/fastmap.c:712 ubi_attach_fastmap()
> > 	warn: PTR_ERR(av) is never (-22)
> > 
> > drivers/mtd/ubi/fastmap.c
> >    703  
> >    704                  av = add_vol(ai, be32_to_cpu(fmvhdr->vol_id),
> >    705                               be32_to_cpu(fmvhdr->used_ebs),
> >    706                               be32_to_cpu(fmvhdr->data_pad),
> >    707                               fmvhdr->vol_type,
> >    708                               be32_to_cpu(fmvhdr->last_eb_bytes));
> >    709  
> >    710                  if (!av)
> >    711                          goto fail_bad;
> >    712                  if (PTR_ERR(av) == -EINVAL) {
> > 
> > av is either -EEXIST or -ENOMEM.  It's never -EINVAL.
> The commit e96a8a3bb671 ("UBI: Fastmap: Do not add vol if it already exists")
> adds a "return ERR_PTR(-EINVAL);" to add_vol(). So I think av could be -EINVAL.
> You mean add_vol should return -EEXIST instead of -EINVAL?
>

Oh, ah.  I'm on linux-next.  Commit de4c455b3e9f ("UBI: factorize code
used to manipulate volumes at attach time") removed the -EINVAL.

It's really Boris to blame for this warning.  I'm not sure what the fix
is.

regards,
dan carpenter
