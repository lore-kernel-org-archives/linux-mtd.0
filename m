Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WenhX-0003si-To
 for linux-mtd@lists.infradead.org; Mon, 28 Apr 2014 15:42:40 +0000
Received: by mail-pd0-f173.google.com with SMTP id p10so5537484pdj.32
 for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2014 08:42:17 -0700 (PDT)
Date: Mon, 28 Apr 2014 23:42:09 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: Add support to use nand_base poi databuf
 as bounce buffer
Message-ID: <20140428154207.GB2020@localhost.localdomain>
References: <1398375634-24759-1-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398375634-24759-1-git-send-email-kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 24, 2014 at 05:40:34PM -0400, Kamal Dasu wrote:
> nand_base can be passed a kmap()'d buffers from highmem by
> filesystems like jffs2. This results in failure to map the
In actually, the highmem buffer may also allocated by vmalloc(), such as
used in the UBIFS.

thanks
Huang Shijie
