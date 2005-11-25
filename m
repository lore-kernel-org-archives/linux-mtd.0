Received: from s131.mittwaldmedien.de ([62.216.178.31])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Efc36-00044h-1R
	for linux-mtd@lists.infradead.org; Fri, 25 Nov 2005 06:47:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id D2DC25E57F2
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Nov 2005 12:47:22 +0100 (CET)
Received: from lin01.mn-solutions.de (p54B2840B.dip0.t-ipconnect.de
	[84.178.132.11])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id D128C5E57F0
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Nov 2005 12:47:21 +0100 (CET)
Received: from mnz66.mn-solutions.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 485141E014C
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Nov 2005 12:46:30 +0100 (CET)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: linux-mtd@lists.infradead.org
Date: Fri, 25 Nov 2005 12:47:41 +0100
References: <4386F21B.9010507@inf.u-szeged.hu>
In-Reply-To: <4386F21B.9010507@inf.u-szeged.hu>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511251247.41142.hs4233@mail.mn-solutions.de>
Subject: Re: New compression method for JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> - it uses the kernel's CryptoAPI interface, and will allow not only
> compressors but also crypto algorithms

Does this make the zImage bigger or smaller as compared to the current JFFS2 ?
