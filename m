Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKnrT-0001As-ED
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 11:50:16 +0000
Message-ID: <1393933791.3412.208.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: block: Use ENOSYS as return value when
 CONFIG_UBIBLOCK=n
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 04 Mar 2014 13:49:51 +0200
In-Reply-To: <1393930663-8737-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393930663-8737-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Tue, 2014-03-04 at 07:57 -0300, Ezequiel Garcia wrote:
> In order to have a way of distinguishing an invalid ioctl from a
> not supported (but otherwise valid) ioctl, this commit changes the
> return value of the ioctl stubs from ENOTTY to ENOSYS.

Sounds logical, no objections, except it is curious if this is something
you invented or this is a general rule in the Linux kernel? If it is,
may be you can point to some discussions, or give some example or other
source of this knowledge? I just want to be educated a bit. Thanks!

-- 
Best Regards,
Artem Bityutskiy
