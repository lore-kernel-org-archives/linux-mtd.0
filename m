Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqFYg-0001cl-Ji
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 06:45:23 +0000
Received: by pacwv17 with SMTP id wv17so31850883pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 06 May 2015 23:45:00 -0700 (PDT)
Date: Wed, 6 May 2015 23:44:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH 12/35 linux-next] mtd: constify of_device_id array
Message-ID: <20150507064456.GC6055@norris-Latitude-E6410>
References: <1426533469-25458-1-git-send-email-fabf@skynet.be>
 <1426533651-25586-1-git-send-email-fabf@skynet.be>
 <1426533651-25586-3-git-send-email-fabf@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1426533651-25586-3-git-send-email-fabf@skynet.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Han Xu <han.xu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 16, 2015 at 08:20:28PM +0100, Fabian Frederick wrote:
> of_device_id is always used as const.
> (See driver.of_match_table and open firmware functions)
> 
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

Applied to l2-mtd.git.
