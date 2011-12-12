Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaDQs-0007wL-9e
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 21:29:10 +0000
Received: by lahc1 with SMTP id c1so692051lah.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2011 13:29:08 -0800 (PST)
Subject: Re: [PATCH] libmtd: allow write operations when MEMWRITE is not
 supported
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 12 Dec 2011 23:29:04 +0200
In-Reply-To: <1323459914-25294-1-git-send-email-computersforpeace@gmail.com>
References: <1323459914-25294-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323725347.2297.25.camel@koala>
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

On Fri, 2011-12-09 at 11:45 -0800, Brian Norris wrote:
> MEMWRITE is a recently introduced write interface for MTD; however, it
> is, for now, only supported on NAND flash. mtd-utils should fall back to
> old write methods when either ENOTTY or EOPNOTSUPP are returned.

I've removed "for now, " because I am not sure it will ever be, and
pushed this to mtd-utils.git, thanks!

Artem.
