Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M6SnX-0006Us-WB
	for linux-mtd@lists.infradead.org; Tue, 19 May 2009 17:08:23 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id 0792E65000E
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 May 2009 19:10:10 +0200 (CEST)
Subject: "Write error in obliterating obsoleted node at" errors
To: linux-mtd@lists.infradead.org
Message-ID: <OF2E38ED0F.7540BED6-ONC12575BB.005D6473-C12575BB.005E224D@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 19 May 2009 19:08:12 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Running "cp /a /b; rm -rf /b" in a loop and I get a few errors:
Write error in obliterating obsoleted node at 0x07440000: -30
Write error in obliterating obsoleted node at 0x00b60000: -30
Write error in obliterating obsoleted node at 0x05ba0000: -30
Write error in obliterating obsoleted node at 0x05aec634: -30
Write error in obliterating obsoleted node at 0x05480000: -30
Write error in obliterating obsoleted node at 0x06dc0000: -30
Write error in obliterating obsoleted node at 0x0254f234: -30
Write error in obliterating obsoleted node at 0x02d00af4: -30
Write error in obliterating obsoleted node at 0x05180000: -30
Write error in obliterating obsoleted node at 0x03800000: -30

These appear to come from cfi_cmdset0001:
	status = map_read(map, adr);
	if (map_word_bitsset(map, status, CMD(0x1a))) {
		unsigned long chipstatus = MERGESTATUS(status);

		/* reset status */
		map_write(map, CMD(0x50), adr);
		map_write(map, CMD(0x70), adr);
		xip_enable(map, chip, adr);

		if (chipstatus & 0x02) {
			ret = -EROFS;

Haven't seen these before in any of our systems. Sounds
familiar to anyone?

On PowerPC, kernel 2.6.27

 Jocke
