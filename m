Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5tA7-0001Z6-LS
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2013 07:23:20 +0000
Message-ID: <1360826613.12703.156.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RFC 1/5] UBIFS: xattr: protect ui_size and data_len by
 ui_mutex
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 14 Feb 2013 09:23:33 +0200
In-Reply-To: <1360750998-15191-2-git-send-email-mkl@pengutronix.de>
References: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
 <1360750998-15191-2-git-send-email-mkl@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-security-module@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-02-13 at 11:23 +0100, Marc Kleine-Budde wrote:
> This patch moves the modification of ui->ui_size and ui->data_len in the
> create_xattr() and change_xattr() functions, so that they are protected by the
> ui_mutex as stated in the documenation of the the struct ubifs_inode.
> 
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>

I guess this one and 2/5 should have 'Cc: stable@vger.kernel.org',
right?

-- 
Best Regards,
Artem Bityutskiy
