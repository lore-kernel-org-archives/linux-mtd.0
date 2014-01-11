Received: from mail-pb0-x22a.google.com ([2607:f8b0:400e:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W24kf-0000ye-Ny
 for linux-mtd@lists.infradead.org; Sat, 11 Jan 2014 20:01:50 +0000
Received: by mail-pb0-f42.google.com with SMTP id uo5so5820987pbc.29
 for <linux-mtd@lists.infradead.org>; Sat, 11 Jan 2014 12:01:28 -0800 (PST)
Date: Sat, 11 Jan 2014 12:01:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] mtd: onenand: Trivial cleanup in samsung.h
Message-ID: <20140111200124.GC1992@norris-Latitude-E6410>
References: <1388038714-10032-1-git-send-email-sachin.kamat@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388038714-10032-1-git-send-email-sachin.kamat@linaro.org>
Cc: trivial@kernel.org, kyungmin.park@samsung.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 26, 2013 at 11:48:34AM +0530, Sachin Kamat wrote:
> commit 93115b7fa8f4 ("mtd: onenand/samsung: make regs-onenand.h file local")
> moved the file to the current location but forgot to remove the pointer to
> its previous location. Clean it up.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed to l2-mtd.git. Thanks!

Brian
