Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bz8jz-0002T5-18
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 20:54:35 +0000
Date: Tue, 25 Oct 2016 23:46:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: shengyong1@huawei.com
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] UBI: Fastmap: Do not add vol if it already exists
Message-ID: <20161025204607.GA27826@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello shengyong,

The patch e96a8a3bb671: "UBI: Fastmap: Do not add vol if it already
exists" from May 26, 2015, leads to the following static checker
warning:

	drivers/mtd/ubi/fastmap.c:712 ubi_attach_fastmap()
	warn: PTR_ERR(av) is never (-22)

drivers/mtd/ubi/fastmap.c
   703  
   704                  av = add_vol(ai, be32_to_cpu(fmvhdr->vol_id),
   705                               be32_to_cpu(fmvhdr->used_ebs),
   706                               be32_to_cpu(fmvhdr->data_pad),
   707                               fmvhdr->vol_type,
   708                               be32_to_cpu(fmvhdr->last_eb_bytes));
   709  
   710                  if (!av)
   711                          goto fail_bad;
   712                  if (PTR_ERR(av) == -EINVAL) {

av is either -EEXIST or -ENOMEM.  It's never -EINVAL.

   713                          ubi_err(ubi, "volume (ID %i) already exists",
   714                                  fmvhdr->vol_id);
   715                          goto fail_bad;
   716                  }
   717  

regards,
dan carpenter
