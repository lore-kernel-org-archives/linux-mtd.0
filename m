Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqhmI-00067O-RU
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 09:39:45 +0000
From: Stefan Roese <sr@denx.de>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: Re: [PATCH] drivers/mtd/devices/spear_smi.c: failure test for null
 rather than negative integer
Date: Mon, 16 Jul 2012 11:38:19 +0200
References: <1341997118-25042-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341997118-25042-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201207161138.19985.sr@denx.de>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 11 July 2012 10:58:38 Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> dev_get_platdata returns a pointer, so the failure value would be NULL
> rather than a negative integer.
> 
> The semantic match that finds this problem is: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,e;
> statement S1,S2;
> @@
> 
> *x = dev_get_platdata(...)
> ... when != x = e
> *if (x < 0) S1 else S2
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Stefan Roese <sr@denx.de>
 
Thanks,
Stefan
