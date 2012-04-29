Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SObwQ-0007kT-D7
 for linux-mtd@lists.infradead.org; Sun, 29 Apr 2012 21:46:02 +0000
Received: by iaky10 with SMTP id y10so4264613iak.36
 for <linux-mtd@lists.infradead.org>; Sun, 29 Apr 2012 14:45:59 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] jffs2: validate symlink size in
 jffs2_do_read_inode_internal()
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Xi Wang <xi.wang@gmail.com>
In-Reply-To: <1335714291.1942.15.camel@koala>
Date: Sun, 29 Apr 2012 17:45:54 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <FD35DFE2-7E03-4B87-AAC6-16002F1B3A0B@gmail.com>
References: <1335379523-31415-1-git-send-email-xi.wang@gmail.com>
 <1335714291.1942.15.camel@koala>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 29, 2012, at 11:44 AM, Artem Bityutskiy wrote:
> 
> I think your commit message is a not general enough because it talks
> about 0xFFFFFFFF value, but there may be any other large value as well.
> I've added the following cause to the commit message and pushed both
> patches to l2-mtd.git, thanks! Please, verify.
> 
> The clause:
> 
> "Artem: we actually validate csize by checking CRC, so this 0xFFs cannot
> come from empty flash region. But I guess an attacker could feed JFFS2
> an image with random csize value, including 0xFFs."

Looks good to me.  Thanks!

- xi
