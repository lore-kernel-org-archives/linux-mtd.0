Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSAgg-0000oq-Ly
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 16:23:59 +0000
Received: by wyb28 with SMTP id 28so1031356wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 09:23:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1306936600-28870-1-git-send-email-jiri.pinkava@vscht.cz>
References: <1306936600-28870-1-git-send-email-jiri.pinkava@vscht.cz>
Date: Thu, 2 Jun 2011 09:23:56 -0700
Message-ID: <BANLkTin0ki3brkxP02pxuZ2m6QBe=9bNhA@mail.gmail.com>
Subject: Re: [PATCH] nand: Remove meaningless delay from nand_unlock
From: Brian Norris <computersforpeace@gmail.com>
To: jiri.pinkava@vscht.cz
Content-Type: text/plain; charset=ISO-8859-1
Cc: dwmw2@infradead.org, Vimal Singh <vimalsingh@ti.com>,
	linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 1, 2011 at 6:56 AM,  <jiri.pinkava@vscht.cz> wrote:
> From: Jiri Pinkava <jiri.pinkava@vscht.cz>
>
> This delay is meaningless. If delay is needed it is device specific
> and must be reimplemented by specific driver, otherwise no delay is
> needed.
>
> This function is not used by any current kernel code, affects only
> external code (like main).

Looks ok to me, but I don't have hardware to test this with.

CC'ing Vimal who added this code originally.

Brian
