Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Oyjn-0007Dk-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2002 10:16:39 +0000
Received: from pcjonashg.axis.se (pcjonashg.axis.se [10.13.8.50])
	by krynn.axis.se (8.12.1/8.12.1/Debian -2) with ESMTP id g0BAR7RM023390
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2002 11:27:07 +0100
Subject: Re: Problem with cfi_probe.c and Intel chip
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 11 Jan 2002 11:27:07 +0100
Message-Id: <1010744827.1306.10.camel@pcjonashg>
Mime-Version: 1.0
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

> > 1. Change it to 0xFF and see if anyone screams.
> I will!

Scream, that is.

> Toshiba 8MiB (TC58FVT641FT) won't leave autoselect mode if you
> change that. Then amd_flash_probe (and jedec_probe I suppose) will not
> be able to detect "mirrors" of previously found chips. /Jonas

Forget the part about amd_flash_probe and jedec_probe. What I meant was
cfi_probe (TC58FVT641FT is a CFI-chip, and I shouldn't write emails
while programming).

/Jonas
