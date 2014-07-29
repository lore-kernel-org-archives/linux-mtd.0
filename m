Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XC8ty-0005EC-AM
 for linux-mtd@lists.infradead.org; Tue, 29 Jul 2014 15:01:25 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: hujianyang <hujianyang@huawei.com>
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
References: <53D7677A.6000905@huawei.com> <53D768B5.6090409@huawei.com>
Date: Tue, 29 Jul 2014 10:48:05 -0400
In-Reply-To: <53D768B5.6090409@huawei.com> (hujianyang@huawei.com's message of
 "Tue, 29 Jul 2014 17:26:13 +0800")
Message-ID: <87vbqgb4re.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29 Jul 2014, hujianyang@huawei.com wrote:

> An ioctl() return pnum of a specified leb.

> Signed-off-by: hujianyang <hujianyang@huawei.com>
> ---
> drivers/mtd/ubi/cdev.c      | 26 ++++++++++++++++++++++++++
> include/uapi/mtd/ubi-user.h | 12 ++++++++++++
> 2 files changed, 38 insertions(+)

Please look at 'ubi_scan()', 

  http://sourcecodebrowser.com/mtd-utils/20110107/libscan_8c.html
  http://sourcecodebrowser.com/mtd-utils/20110107/libscan_8h.html

After this call info->ec[pnum] is,

  EB_EMPTY      (ffffffff) - erased
  EB_CORRUPTED  (fffffffe) - inconsistent UBI data.
  EB_ALIEN      (fffffffd) - non-ubi erase sector
  EB_BAD        (fffffffc) - bad block
  or the LNUM.

To write your code, you can either scan the array (~32-2048 entries)
each time you want an 'lnum' or you could run through the array and
construct the opposite table; a 'logical index' gives a 'physical eb';
this would require keeping track of the 'generation' count.

I think a patch to 'ubi_scan()' to create an 'pmap' array might be
better or more accepted than a Linux/MTD/UBI patch?  Then only the
'ubidump' code is needed and not a properly configured/versioned kernel;
or at least only the nandsim module which is similar to some other
utilities.  If you had a 'ubi_scan()' which has an 'info->pmap[leb]'
which had,

  EB_EMPTY      (ffffffff) - not mapped
  or the PNUM.

Would you need to patch the kernel?

Fwiw,
Bill Pringlemeir.
