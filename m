Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW8mF-0006N1-0i
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 19:28:15 +0000
Date: Thu, 12 Mar 2015 15:27:20 -0400 (EDT)
Message-Id: <20150312.152720.2248943963968220981.davem@redhat.com>
To: christophe.leroy@c-s.fr
Subject: Re: [PATCH 7/8] isdn: replace CONFIG_8xx by CONFIG_PPC_8xx
From: David Miller <davem@redhat.com>
In-Reply-To: <20150312152409.E7B5C1A2422@localhost.localdomain>
References: <20150312152409.E7B5C1A2422@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: isdn@linux-pingi.de, linux-serial@vger.kernel.org,
 user-mode-linux-devel@lists.sourceforge.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, user-mode-linux-user@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Christophe Leroy <christophe.leroy@c-s.fr>
Date: Thu, 12 Mar 2015 16:24:09 +0100 (CET)

> Two config options exist to define powerpc MPC8xx:
> * CONFIG_PPC_8xx
> * CONFIG_8xx
> In addition, CONFIG_PPC_8xx also defines CONFIG_CPM1 as
> communication co-processor
> 
> arch/powerpc/platforms/Kconfig.cputype has contained the following
> comment about CONFIG_8xx item for some years:
> "# this is temp to handle compat with arch=ppc"
> 
> It looks like not many places still have that old CONFIG_8xx used,
> so it is likely to be a good time to get rid of it completely ?
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Acked-by: David S. Miller <davem@davemloft.net>
