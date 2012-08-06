Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SyWK1-0006u5-4Q
 for linux-mtd@lists.infradead.org; Mon, 06 Aug 2012 23:02:49 +0000
Received: by yenr9 with SMTP id r9so3375177yen.36
 for <linux-mtd@lists.infradead.org>; Mon, 06 Aug 2012 16:02:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <501A1720.6000604@linux.vnet.ibm.com>
References: <5019EE49.7000208@linux.vnet.ibm.com>
 <501A1720.6000604@linux.vnet.ibm.com>
Date: Mon, 6 Aug 2012 16:02:47 -0700
Message-ID: <CAN8TOE8+A+kG8A9sB_qiD9huCWR-bwSiEkgjEqSXohFGdsEGkg@mail.gmail.com>
Subject: Re: jffs2 copy too long after mounting
From: Brian Norris <computersforpeace@gmail.com>
To: hejianet <hejianet@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 1, 2012 at 10:58 PM, hejianet <hejianet@linux.vnet.ibm.com> wrote:
> Is there anyway to show the summary result of jffs2's fragmentation?
> Is there anyway to manually make defragmentation?

I'm not a JFFS2 expert, but I don't believe fragmentation really is an
issue in quite the same way as in spinning-disk, block storage
filesystems like FAT. Access time to all blocks on an MTD is uniform.

Also, I quite doubt there is a tool that displays the low-level
details of file/block mapping.

Regards,
Brian
