Received: from miranda.axis.se ([193.13.178.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157DL4-0004Tu-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 10:41:27 +0100
Message-ID: <018601c0eda3$fff76770$0a070d0a@axis.se>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
   "David S. Miller" <davem@redhat.com>
Cc: "Chris Wedgwood" <cw@f00f.org>, "Jeff Garzik" <jgarzik@mandrakesoft.com>,
   <bjorn.wesen@axis.com>, <linux-kernel@vger.kernel.org>,
   <linux-mtd@lists.infradead.org>
References: <15132.22933.859130.119059@pizda.ninka.net>  <13942.991696607@redhat.com> <3B1C1872.8D8F1529@mandrakesoft.com> <15132.15829.322534.88410@pizda.ninka.net> <20010605155550.C22741@metastasis.f00f.org>  <25587.991730769@redhat.com>
Subject: Re: Missing cache flush. 
Date: Tue, 5 Jun 2001 11:43:39 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
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

Possibly saying something extremly stupid here,
how about simply "fakewriting" 0xFF to the flash
after an erase to update any caches?

> 2. Flash. A few writes of magic data to magic addresses and a whole erase
>    block suddenly contains 0xFF. The CPU doesn't notice that either.

 do_erase_stuff();
 /* While verifying, update cache */
                for (address = adr; address < (adr + size); address++) {
                        if ((verify = map->read8(map, address)) != 0xFF) {
                                error = 1;
                                break;
                        }
                        /* "Fake" write 0xFF's to the erased sector so that
caches are updated
                         *  after we verified that uncached data is ok
                         */
                        *(unsigned char*)CACHED(address) = 0xFF;
                }

/Johan
