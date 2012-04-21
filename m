Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLb66-0005ma-BW
 for linux-mtd@lists.infradead.org; Sat, 21 Apr 2012 14:15:34 +0000
Received: by lbol5 with SMTP id l5so3213117lbo.36
 for <linux-mtd@lists.infradead.org>; Sat, 21 Apr 2012 07:15:31 -0700 (PDT)
Message-ID: <1335017578.28642.6.camel@brekeke>
Subject: Re: [PATCH] jffs2: refactor csize in jffs2_do_read_inode_internal()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Xi Wang <xi.wang@gmail.com>
Date: Sat, 21 Apr 2012 17:12:58 +0300
In-Reply-To: <1334011379-24445-1-git-send-email-xi.wang@gmail.com>
References: <1334011379-24445-1-git-send-email-xi.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2012-04-09 at 18:42 -0400, Xi Wang wrote:
> Replace the verbose `je32_to_cpu(latest_node->csize)' with a shorter
> variable `csize'.
> 
> Also check for a bogus `csize' value 0xffffffff, which would turn the
> subsequent kmalloc(cisze + 1, ...) into kmalloc(0, ...).
> 
> Signed-off-by: Xi Wang <xi.wang@gmail.com>

Looks good. I wonder, does it fix a real-life issue or you spotted this
place while reviewing/fixing warnings/other janitor type of work?

-- 
Best Regards,
Artem Bityutskiy
