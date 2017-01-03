Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOWmI-0003fH-NE
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 21:37:55 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rdma@vger.kernel.org,
 fcoe-devel@open-fcoe.org, alsa-devel@alsa-project.org,
 linux-fbdev@vger.kernel.org, xen-devel@lists.xenproject.org,
 davem@davemloft.net, airlied@linux.ie, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] uapi: use wildcards to list files
Date: Tue, 03 Jan 2017 22:37:04 +0100
Message-ID: <2108827.WpE3IvfEdH@wuerfel>
In-Reply-To: <1483454144-10519-1-git-send-email-nicolas.dichtel@6wind.com>
References: <20161203.192346.1198940437155108508.davem@davemloft.net>
 <1483454144-10519-1-git-send-email-nicolas.dichtel@6wind.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, January 3, 2017 3:35:44 PM CET Nicolas Dichtel wrote:
> Regularly, when a new header is created in include/uapi/, the developer
> forgets to add it in the corresponding Kbuild file. This error is usually
> detected after the release is out.
> 
> In fact, all headers under include/uapi/ should be exported, so let's
> use wildcards.

I think the idea makes a lot of sense: if a header is in uapi, we should
really export it. However, using a wildcard expression seems a bit
backwards here, I think we should make this implicit and not have the
Kbuild file at all.

The "header-y" syntax was originally added back when the uapi headers
were mixed with the internal headers in the same directory. After
David Howells introduced the separate directory for uapi, it has
become a bit redundant.

Can you try to modify scripts/Makefile.headersinst instead so we
can simply remove the Kbuild files entirely?

	Arnd
