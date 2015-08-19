Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRrSR-0004o0-2B
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 00:42:24 +0000
Received: by pdbmi9 with SMTP id mi9so33231317pdb.3
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 17:42:02 -0700 (PDT)
Date: Tue, 18 Aug 2015 17:41:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] mtd: nettel: do not ignore mtd_device_register() failure
 in nettel_init()
Message-ID: <20150819004158.GR60523@google.com>
References: <1439505467-32746-1-git-send-email-khoroshilov@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439505467-32746-1-git-send-email-khoroshilov@ispras.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 14, 2015 at 01:37:47AM +0300, Alexey Khoroshilov wrote:
> If mtd_device_register() fails in nettel_init(), iomap left mapped.
> 
> The patch adds failure handling for mtd_device_register().
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>

Applied to l2-mtd.git
