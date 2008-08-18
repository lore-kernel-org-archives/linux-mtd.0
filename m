Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KVDru-0007nZ-Ll
	for linux-mtd@lists.infradead.org; Mon, 18 Aug 2008 23:10:52 +0000
Received: by wf-out-1314.google.com with SMTP id 28so2314150wfc.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Aug 2008 16:10:21 -0700 (PDT)
Message-ID: <8bd0f97a0808181610x2e5efce0lb00ba5c0cf9e1e9a@mail.gmail.com>
Date: Mon, 18 Aug 2008 19:10:21 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Hirofumi Nakagawa" <hnakagawa@miraclelinux.com>
Subject: Re: [PATCH] Remove duplicated unlikely() in IS_ERR()
In-Reply-To: <48A52D69.1040501@miraclelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48A52D69.1040501@miraclelinux.com>
Cc: yoshfuji@linux-ipv6.org, linux-s390@vger.kernel.org,
	christof.schmitt@de.ibm.com, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 15, 2008 at 3:16 AM, Hirofumi Nakagawa wrote:
> Some drivers have duplicated unlikely() macros.
> IS_ERR() already has unlikely() in itself.
> This patch cleans up such pointless codes although there is no real
> effect on the kernel's behaviour.

sounds like a good check to add to checkpatch.pl ...
-mike
