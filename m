Received: from law14-oe60.law14.hotmail.com ([64.4.20.195] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19N6sd-00084Q-2a
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jun 2003 09:10:51 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Tue, 3 Jun 2003 13:41:48 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE60hyN0a0SMh0002fd22@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: uclinux-dev@uclinux.org
Subject: cfi_probe_chip  problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi people.
i built mtd and jffs2 support in my kernel with the flash chip is
AM29DL323GB .

Now my kernel doesnot boot  after I have put in MTD and JFFS2 supoort.

I am using CYGWN plus I am not very well versed with oops tracing and stuff
but I have been able to find out where theproblem is

Let me tell u in detail with a map
cfi_probe     calls
     cfi_probe_chip. calls
             cfi_send_gen_cmd calls
                              cfi_build_cmd
                            cfi_build_cmd  returns
       cfi_send_gen_cmd:   code
                        if (prev_val)
                     *prev_val = cfi_read(map, addr); doesnot satify
         cfi_send_gen_cmd     calls
                           cfi_write     The values called are  __u32
val=250 and __u32 addr = 0
                            cfi_write calls
                                   mymap->write16 calls
                                      __raw_writew(d, map->map_priv_1 +
adr);
                                       __raw_writew(d, map->map_priv_1 +
adr);      returns
                                     mymap->write16  returns
                           cfi_write retruns
        cfi_send_gen_cmd  returns
cfi_probe_chip again calls
               cfi_send_gen_cmd
                       .........similar to above stack
                              cfi_write     The values called are  __u32
val=152 and __u32 addr = 170
cfi_write calls
                                   mymap->write16 calls
                                       __raw_writew(d, map->map_priv_1 +
adr);
                                                        DOES NOT RETURN
Whay could be wrong here?

Help me here
Vikram Mehta
