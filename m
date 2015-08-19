Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRrik-0001Kt-Uo
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 00:59:15 +0000
Received: by pdob1 with SMTP id b1so18505996pdo.2
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 17:58:54 -0700 (PDT)
Date: Tue, 18 Aug 2015 17:58:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Colin King <colin.king@canonical.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Aaron Sierra <asierra@xes-inc.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Fabian Frederick <fabf@skynet.be>,
 Joe Schultz <jschultz@xes-inc.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: fix null pointer deference when kzalloc returns null
Message-ID: <20150819005851.GU60523@google.com>
References: <1437129472-13099-1-git-send-email-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437129472-13099-1-git-send-email-colin.king@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 17, 2015 at 11:37:52AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> static analysis by smatch caught the following error:
> 
> drivers/mtd/maps/physmap_of.c:135 of_get_probes()
>    error: potential null dereference 'res'.  (kzalloc returns null)
> 
> Check for failed kzalloc and return -ENOMEM in of_flash_probe if
> this occurs.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Pushed to l2-mtd.git
