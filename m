Received: from h011.c007.snv.cp.net ([209.228.33.239] helo=c007.snv.cp.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zty9-0006vz-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 14:56:53 +0100
Reply-To: <acurtis@directvinternet.com>
From: <acurtis@directvinternet.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	<acurtis@directvinternet.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: What happened to 64-bit support? 
Date: Wed, 31 Jul 2002 06:56:20 -0700
Message-ID: <NCBBIINEHIPFGJPLBEIFOEBGDKAA.acurtis@directvinternet.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <31698.1028103598@redhat.com>
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

> >  In theory yes. if CONFIG_MTD_CFI_B8 translates to 64-bits in config
> > (which I believe it does, then yes) As I mentioned, the problem
> > appears to be in the probe routines not liking an octet of 8.
>
> What exactly happens?

cfi_probe() terminates with an unsupported buswidth. The devices do get
mounted as ROM but then they are read-only.

Sequence:
cfi - unsupported buswidth
jedec - fails
ROM - mapped but read-only
