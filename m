Received: from mail-pb0-x22b.google.com ([2607:f8b0:400e:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHOp6-00012E-RM
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 02:29:45 +0000
Received: by mail-pb0-f43.google.com with SMTP id ma3so2408656pbc.2
 for <linux-mtd@lists.infradead.org>; Sat, 22 Feb 2014 18:29:23 -0800 (PST)
Date: Sat, 22 Feb 2014 18:29:21 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] mtd: nand: s3c2410: Trivial cleanup in header file
Message-ID: <20140223022921.GG11836@norris-Latitude-E6410>
References: <1392360398-6650-1-git-send-email-sachin.kamat@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1392360398-6650-1-git-send-email-sachin.kamat@linaro.org>
Cc: trivial@kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 14, 2014 at 12:16:38PM +0530, Sachin Kamat wrote:
> Commit 436d42c61c3e ("ARM: samsung: move platform_data definitions")
> moved the files to the current location but forgot to remove the pointer
> to its previous location. Clean it up. While at it also add the header
> file protection macros appropriately.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed to l2-mtd.git. Thanks!

Brian
