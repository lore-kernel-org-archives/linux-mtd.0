Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsJxW-0003sQ-KQ
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 00:23:51 +0000
Received: by pasz6 with SMTP id z6so87946254pas.2
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 17:23:29 -0700 (PDT)
Date: Fri, 30 Oct 2015 17:23:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: devicetree-spec@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH v4] doc: dt: mtd: support partitions in a special
 'partitions' subnode
Message-ID: <20151031002326.GM13239@google.com>
References: <1446072486-145169-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446072486-145169-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 28, 2015 at 03:48:06PM -0700, Brian Norris wrote:
> From: Michal Suchanek <hramrach@gmail.com>
> 
> To avoid conflict with other drivers using subnodes of the mtd device
> create only one ofpart-specific node rather than any number of
> arbitrary partition subnodes.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied to l2-mtd.git
