Received: from mail-ea0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TkUJC-0006CK-Tr
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2012 06:36:15 +0000
Received: by mail-ea0-f177.google.com with SMTP id c10so2165009eaa.36
 for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2012 22:36:10 -0800 (PST)
Date: Mon, 17 Dec 2012 08:35:57 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH 1/2] mtd: cmdlinepart: fix skipping zero sized partition
Message-ID: <20121217083557.6e0e833a@pixies.home.jungo.com>
In-Reply-To: <714bcce84fccef617818f8916475a666f880cbf1.1355438632.git.christophercordahi@nanometrics.ca>
References: <cover.1355438632.git.christophercordahi@nanometrics.ca>
 <714bcce84fccef617818f8916475a666f880cbf1.1355438632.git.christophercordahi@nanometrics.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Chris.

On Sun, 16 Dec 2012 19:59:29 -0500 Christopher Cordahi <christophercordahi@nanometrics.ca> wrote:
> Decrement index i after skipping a zero sized partition.  On next loop
> iteration, the index will be the same as before, but the data will be
> new as it was moved when earlier partition was skipped.
> 
> Signed-off-by: Christopher Cordahi <christophercordahi@nanometrics.ca>

Acked-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
