Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dy7fU-00084V-Fq
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 08:39:36 -0400
Date: Thu, 28 Jul 2005 14:39:12 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050728123912.GA27734@synertronixx3>
References: <20050706144545.GA11447@zappa> <20050728121746.GA28368@zappa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050728121746.GA28368@zappa>
Subject: Re: xip changes between 2.6.11 and 20050530?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-07-28 14:17 +0200 schrieb Konstantin Kletschke:

> I switched off CONFIG_FPE_NWFPE=y which the XIP System seems to depend
> on!

Also I realize, that the only toolchain creating a functional xipuImage
is gcc-3.3.3 with binutils-2.14.90.
Any newer components are creating a freezing xipuImage.

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
