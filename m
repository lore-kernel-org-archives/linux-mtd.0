Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PkfMh-0000AY-K4
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 16:15:32 +0000
Received: by gyg4 with SMTP id 4so53596gyg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Feb 2011 08:15:29 -0800 (PST)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <201102021709.04929.fabio.giovagnini@aurion-tech.com>
References: <201101301935.38730.fabio.giovagnini@aurion-tech.com>
	<AANLkTiktds1RAAZK6ynUOL3L0hsqXjR99mcBsCeagD5B@mail.gmail.com>
	<201102021441.17956.fabio.giovagnini@aurion-tech.com>
	<201102021709.04929.fabio.giovagnini@aurion-tech.com>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Wed, 2 Feb 2011 17:14:03 +0100
Message-ID: <AANLkTim3mij_QtNBq3ETW4MyHxp9XE-pduiRZaabKT-5@mail.gmail.com>
Subject: Re: Support for SST 39VF6402B has been officially added or I need to
	patch the kernel?
To: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2011/2/2 Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>:
> But in my files I do not have nothing of these.

Could you please provide me with a log with DEBUG_CFI enabled in
drivers/mtd/chips/cfi_probe.c ?

-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
