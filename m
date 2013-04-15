Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1URgM5-0006A3-4B
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2013 10:09:45 +0000
Message-ID: <1366020693.2768.41.camel@sauron.fi.intel.com>
Subject: Re: UBIFS: make space fixup work in the remount case
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Apr 2013 13:11:33 +0300
In-Reply-To: <20130415095924.GA26544@elgon.mountain>
References: <20130415095924.GA26544@elgon.mountain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-04-15 at 12:59 +0300, Dan Carpenter wrote:
>   1571          if (c->space_fixup) {
>   1572                  err = ubifs_fixup_free_space(c);
>   1573                  if (err)
>   1574                          return err;
>                                 ^^^^^^^^^^
> Shouldn't this be a "goto out?".  We're holding the c->umount_mutex.

Hi Dan, I fixed this up and answered the reporter:
https://patchwork.kernel.org/patch/2284681/

It is now 'goto out'. Thanks!

-- 
Best Regards,
Artem Bityutskiy
