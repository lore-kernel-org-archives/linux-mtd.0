Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ogz5v-00080g-L5
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 11:58:44 +0000
Received: by qwe4 with SMTP id 4so4460590qwe.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 04:58:42 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <20100805111819.27536.1397.stgit@dev.siriade.com>
References: <20100805111819.27536.1397.stgit@dev.siriade.com>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 5 Aug 2010 13:58:22 +0200
Message-ID: <AANLkTi=1eXK=1bVDDhL0sZ3ByfYkKREv6373ogYc+MG-@mail.gmail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: consider version 1.4 as a valid
	primary extension version
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Cc: Gernot Hoyler <Gernot.Hoyler@spansion.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/8/5 Guillaume LECERF <glecerf@gmail.com>:
> The Spansion S29WS-P device family uses CFI version 1.4 [1].
> Consider it as a valide version.
>
> [1] http://www.spansion.com/Support/Datasheets/s29ws-p_00_a12_e.pdf
>
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>


Please discard this patch, I sent a v2 with some minor cosmetic changes.


-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
