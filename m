Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsJvm-0003jE-D3
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 00:22:02 +0000
Received: by pasz6 with SMTP id z6so87914625pas.2
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 17:21:41 -0700 (PDT)
Date: Fri, 30 Oct 2015 17:21:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 5/5] mtd: ofpart: move ofpart partitions to a
 dedicated dt node
Message-ID: <20151031002138.GL13239@google.com>
References: <cover.1439911625.git.hramrach@gmail.com>
 <78e45e51c94899f92ec5d189846c5dd5cf9d8f7a.1439911625.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78e45e51c94899f92ec5d189846c5dd5cf9d8f7a.1439911625.git.hramrach@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 18, 2015 at 03:34:09PM -0000, Michal Suchanek wrote:
> Parsing direct subnodes of a mtd device as partitions is unreliable
> since the mtd device is also part of its bus subsystem and can contain
> bus data in subnodes.
> 
> Move ofpart data to a subnode of its own so it is clear which data is
> part of the partition layout.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>

Applied this patch to l2-mtd.git. Thanks!
