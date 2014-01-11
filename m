Received: from mail-pd0-f170.google.com ([209.85.192.170])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W24UM-0000aw-So
 for linux-mtd@lists.infradead.org; Sat, 11 Jan 2014 19:45:00 +0000
Received: by mail-pd0-f170.google.com with SMTP id z10so549564pdj.1
 for <linux-mtd@lists.infradead.org>; Sat, 11 Jan 2014 11:44:31 -0800 (PST)
Date: Sat, 11 Jan 2014 11:44:28 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 1/2] mtd: omap2: Cleanup header files
Message-ID: <20140111194428.GB1992@norris-Latitude-E6410>
References: <1388385021-1881-1-git-send-email-sachin.kamat@linaro.org>
 <20980858CB6D3A4BAE95CA194937D5E73EA5D9ED@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA5D9ED@DBDE04.ent.ti.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "patches@linaro.org" <patches@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 06:46:15AM +0000, Pekon Gupta wrote:
> >From: linux-mtd On Behalf Of Sachin Kamat
> >
> >Commit 2203747c9771 ("ARM: omap: move platform_data definitions")
> >moved the files to the current location but forgot to remove the pointer
> >to its previous location. Clean it up.
> >
> >Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> 
> Acked-by: Pekon Gupta <pekon@ti.com>

Pushed both to l2-mtd.git. Thanks.

Brian
