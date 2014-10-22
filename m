Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgrTh-0004i0-CU
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:41:09 +0000
Received: by mail-pd0-f181.google.com with SMTP id w10so3049175pde.26
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 01:40:48 -0700 (PDT)
Date: Wed, 22 Oct 2014 01:40:45 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH V2 linux-next] jffs2: fix sparse warning: unexpected unlock
Message-ID: <20141022084045.GI16128@brian-ubuntu>
References: <1411932392-7751-1-git-send-email-fabf@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1411932392-7751-1-git-send-email-fabf@skynet.be>
Cc: linux-mtd@lists.infradead.org, linux-sparse@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Josh Triplett <josh@joshtriplett.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 28, 2014 at 09:26:32PM +0200, Fabian Frederick wrote:
> fs/jffs2/summary.c:846:5: warning: context imbalance in 'jffs2_sum_write_sumnode' - unexpected unlock
> 
> Suggested-by: Brian Norris <computersforpeace@gmail.com>
> Suggested-by: Josh Triplett <josh@joshtriplett.org>
> Signed-off-by: Fabian Frederick <fabf@skynet.be>
> ---
> V2: use __must_hold instead of __releases / __acquires
> (suggested by Brian Norris and Josh Triplett)

Pushed to l2-mtd.git. Thanks!

Brian
