Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QCu8P-0002CK-Eu
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 13:41:30 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.244])
	by co202.xi-lite.net (Postfix) with ESMTPS id 7EADF260297
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Apr 2011 17:16:28 +0200 (CEST)
Message-ID: <4DB033E4.6030105@parrot.com>
Date: Thu, 21 Apr 2011 15:40:52 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: bbt and bitflip
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

the current bad block table implementation doesn't seem robust against bit flip.

at boot we call :
- search_read_bbts which scan for bbt using oob pattern.
- check_create
-- read_abs_bbt
--- read_bbt which ignore ecc bit flip/error

So if bit flip happen in BBT, we never scrub it.
And if bit flip accumulate and we can't correct it anymore, the code will parse
the corrupted data and our bad block info will be wrong (valid block can be
marked as bad and we lose bad, bad block can be see as valid).


Also the pattern and version in oob isn't protected by ecc. They can be corrupted.

Are bbt safe to use ?

Are there any plan to make the bbt more robust ?
