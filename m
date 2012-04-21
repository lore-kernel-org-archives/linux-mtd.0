Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLdQf-0004Qd-Np
 for linux-mtd@lists.infradead.org; Sat, 21 Apr 2012 16:44:58 +0000
Received: by iaky10 with SMTP id y10so17982668iak.36
 for <linux-mtd@lists.infradead.org>; Sat, 21 Apr 2012 09:44:54 -0700 (PDT)
Subject: Re: [PATCH] jffs2: refactor csize in jffs2_do_read_inode_internal()
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Xi Wang <xi.wang@gmail.com>
In-Reply-To: <1335017578.28642.6.camel@brekeke>
Date: Sat, 21 Apr 2012 12:44:48 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <19972DBF-9F99-4250-84F5-C8225E21322C@gmail.com>
References: <1334011379-24445-1-git-send-email-xi.wang@gmail.com>
 <1335017578.28642.6.camel@brekeke>
To: dedekind1@gmail.com
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 21, 2012, at 10:12 AM, Artem Bityutskiy wrote:

> Looks good. I wonder, does it fix a real-life issue or you spotted this
> place while reviewing/fixing warnings/other janitor type of work?

Thanks for reviewing. ;-)

The patch tries to fix a warning issued by a homemade static analysis
tool that looks for integer overflows.

- xi
