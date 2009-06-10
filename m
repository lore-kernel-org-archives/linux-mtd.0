Subject: Re: [PATCHv2] MTD: Add UBI reboot notifier
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kevin Cernekee <kpc.mtd@gmail.com>
In-Reply-To: <f5be75d5abc1acd236bedf36c55a860e@localhost>
References: <1244550775.5847.385.camel@localhost.localdomain>
	<f5be75d5abc1acd236bedf36c55a860e@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Jun 2009 12:35:09 +0300
Message-Id: <1244626509.5847.399.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-06-09 at 10:59 -0700, Kevin Cernekee wrote:
> Terminate the UBI background thread prior to restarting the system.
> 
> Changes from v1:
> 
> Add ubi_sync() at the end, to make sure the underlying MTD device has
> synchronized its buffers.
> 
> Clean up comments and formatting.
> 
> Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>

I've pushed this patch to ubi-2.6.git/master. I've tested it
even. And I amended comments a little. Please, check it:

http://git.infradead.org/ubi-2.6.git?a=commit;h=79c293b2629882a1db3a850ed6b84bd1d8a464a7

If you are fine with this, I'll put it to ubi-2.6.git/linux-next
and merge it this merge window.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
