Received: from mail-oa0-x233.google.com ([2607:f8b0:4003:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYluL-0000Ee-2t
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 00:02:41 +0000
Received: by mail-oa0-f51.google.com with SMTP id h1so71118oag.10
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 17:02:19 -0700 (PDT)
Date: Tue, 22 Oct 2013 17:02:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: Move major number definitions to major.h
Message-ID: <20131023000215.GS23337@ld-irv-0074.broadcom.com>
References: <1381698323-18932-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381698323-18932-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 13, 2013 at 06:05:23PM -0300, Ezequiel Garcia wrote:
> This patch moves the char and block major number definitions
> to major.h to be with the rest of the major numbers.
> While doing this, include major.h in the files that need it.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Pushed to l2-mtd.git. Thanks!

Brian
