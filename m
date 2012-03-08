Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5dhF-0002GX-6v
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 13:47:58 +0000
Message-ID: <1331214629.7257.58.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: allocate verification buffer on demand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: josselin.costanzi@mobile-devices.fr
Date: Thu, 08 Mar 2012 15:50:29 +0200
In-Reply-To: <4f450bbc.334cb40a.7321.64ad@mx.google.com>
References: <1329925025-4980-1-git-send-email-y>
 <4f450bbc.334cb40a.7321.64ad@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-02-22 at 16:37 +0100, josselin.costanzi@mobile-devices.fr
wrote:
> From: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
> 
> Instead of using pre-allocated 'ubi->peb_buf2' buffer in
> 'ubi_eba_copy_leb()', dynamically allocate it when needed. The intent is
> to get rid of the pre-allocated 'ubi->peb_buf2' buffer and save up to
> 2MiB of RAM per attached device (or more if PEB size is larger). If the
> allocation fails, we fallback to a degraded mode where data integrity is
> still ensured, at the cost of higher CPU usage.

Hi, thanks for the patch! We actually do not need peb_buf2 at all, we
can just always use CRC for checking. So I have modified your patch a
bit. I'll send them shortly. Also, you did not add Signed-off-by - I did
it for you, but I am not supposed to do this :-) I also added another
patch which renames peb_buf1 to peb_buf. I'll send them out shortly -
please - review and test. Once you report that they work, I'll push them
to my tree. Thanks!

And yeah, as you already suggested, you do not have to allocate so much
memory for peb_buf as well. 2-4 NAND pages is good enough. You can
optimize RAM usage further then. And I think that CRC caclulation for
partial buffers can be done easily - you just use UBI_CRC32_INIT seed
for the first chunk, then you pass the previous CRC as the seed for the
next chunk and so on. The result should be the same as calculating CRC
for the whole buffer at once.

Also, peb_buf1 does not have to be pre-allocated. You can allocate it
when you actually need it, and then free it. Use
'mtd_kmalloc_up_to(ubi->mtd, 512)' for example.

If the system does not have memory at all, then it is in big trouble
anyway.

-- 
Best Regards,
Artem Bityutskiy
