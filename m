Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D177J-0005DN-6I
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 13:08:09 -0500
Date: Tue, 15 Feb 2005 19:08:09 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050215180809.GA15503@synertronixx3>
References: <20050215154819.GB831@synertronixx3>
	<Pine.LNX.4.61.0502151055150.27338@localhost.localdomain>
	<20050215165048.GE831@synertronixx3>
	<Pine.LNX.4.61.0502151210270.27338@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0502151210270.27338@localhost.localdomain>
Subject: Re: XIP aware file system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-02-15 12:12 -0500 schrieb Nicolas Pitre:

> Where does that 112/4 come from?

OSCR: 3.6MHz
i.MX Timer: 32kHz

3.6/0.032~112

OSCR/4 == i.MX Timer*(112/4)

There I got my 28 from :)

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
