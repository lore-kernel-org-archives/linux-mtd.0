Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ad2NV-0002nz-TX
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 21:07:46 +0000
Received: by mail-pa0-x244.google.com with SMTP id fl4so8335355pad.2
 for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2016 13:07:25 -0800 (PST)
Date: Mon, 7 Mar 2016 13:07:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 1/1] mtd: mtdram: Add parameter for setting writebuf
 size
Message-ID: <20160307210722.GZ55664@google.com>
References: <1456932419-14614-1-git-send-email-alexander.stein@systec-electronic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456932419-14614-1-git-send-email-alexander.stein@systec-electronic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 02, 2016 at 04:26:59PM +0100, Alexander Stein wrote:
> ubifs uses the write buffer size in recovery algorithm. When inspecting
> an unclean ubifs recovery fails with writebuf size 64 in mtdram while
> recovery on actual mtd device with writebuf size of 1024 succeeds.
> So add a parameter for setting this property.
> 
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> Reviewed-by: Richard Weinberger <richard@nod.at>

Applied to l2-mtd.git
