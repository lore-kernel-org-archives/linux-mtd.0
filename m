Received: from h000.c007.snv.cp.net ([209.228.33.228] helo=c007.snv.cp.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZkHe-0005tm-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 04:36:22 +0100
Reply-To: <acurtis@directvinternet.com>
From: <acurtis@directvinternet.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: What happened to 64-bit support? 
Date: Tue, 30 Jul 2002 20:35:50 -0700
Message-ID: <NCBBIINEHIPFGJPLBEIFMEBADKAA.acurtis@directvinternet.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <14860.1028068549@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> Did you actually enable 64-bit support? It's not on by default because it
> slows things down.
>
> CONFIG_MTD_ADV_OPTIONS=y, CONFIG_MTD_CFI_GEOMETRY=y,
> CONFIG_MTD_CFI_B8=y, CONFIG_MTD_CFI_I4=y.

In theory yes. if CONFIG_MTD_CFI_B8 translates to 64-bits in config (which I
believe it does, then yes) As I mentioned, the problem appears to be in the
probe routines not liking an octet of 8.
