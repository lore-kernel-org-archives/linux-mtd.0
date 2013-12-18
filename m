Received: from mail-pb0-x22c.google.com ([2607:f8b0:400e:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtC0q-00068B-4q
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 07:57:49 +0000
Received: by mail-pb0-f44.google.com with SMTP id rq2so8072314pbb.17
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2013 23:57:26 -0800 (PST)
Date: Tue, 17 Dec 2013 23:57:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Rashika Kheria <rashika.kheria@gmail.com>
Subject: Re: [PATCH 1/2] drivers: mtd: Mark functions as static and remove
 unused function in lpddr_cmds.c
Message-ID: <20131218075722.GD5551@norris-Latitude-E6410>
References: <d0512c2bc35b27af33ad79d74d93ecc0f2b4e92c.1386912859.git.rashika.kheria@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0512c2bc35b27af33ad79d74d93ecc0f2b4e92c.1386912859.git.rashika.kheria@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, josh@joshtriplett.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 13, 2013 at 12:44:07PM +0530, Rashika Kheria wrote:
> This patch marks the functions do_write_buffer() and do_erase_oneblock()
> as static because because they are not used outside this file. It also
> removes the unused function word_program() in lpddr/lpddr_cmds.c.
> 
> Thus, it also removes the following warnings in lpddr/lpddr_cmds.c:
> drivers/mtd/lpddr/lpddr_cmds.c:391:5: warning: no previous prototype for ‘do_write_buffer’ [-Wmissing-prototypes]
> drivers/mtd/lpddr/lpddr_cmds.c:472:5: warning: no previous prototype for ‘do_erase_oneblock’ [-Wmissing-prototypes]
> drivers/mtd/lpddr/lpddr_cmds.c:751:5: warning: no previous prototype for ‘word_program’ [-Wmissing-prototypes]
> 
> Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>
> Reviewed-by: Josh Triplett <josh@joshtriplett.org>

Edited the $subjects and pushed both to l2-mtd.git. Thanks!

Brian
