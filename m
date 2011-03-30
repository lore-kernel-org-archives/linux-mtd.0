Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4w0Z-0006bT-Hg
	for linux-mtd@lists.infradead.org; Wed, 30 Mar 2011 14:04:28 +0000
Received: by ywe9 with SMTP id 9so555914ywe.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Mar 2011 07:04:25 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 30 Mar 2011 16:04:25 +0200
Message-ID: <AANLkTimTZgN+oZ+ySNYrkKrF2onCPCSgt8LS7feVPO6H@mail.gmail.com>
Subject: mtdswap: block unused mark IOCTL removal
From: massimo cirillo <maxcir@gmail.com>
To: jarkko.lavinen@nokia.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jarkko,
compared to the original version, in the mtdswap the BLKSWAPMARKUNUSED ioctl
has disappeared. Even if the mtdswap_discard has been introduced, it is not
enough to make a swap block device efficient from a performance point of
view. Is there any reason why that ioctl has been removed ?
