Received: from dsl-62-3-66-203.zen.co.uk
	([62.3.66.203] helo=crown.nexus.co.uk ident=foobar)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AU46Y-0000Pt-Vu
	for <linux-mtd@lists.infradead.org>; Wed, 10 Dec 2003 13:10:15 +0000
From: John Stirling <js@reciva.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1071054191.5712.204.camel@hades.cambridge.redhat.com>
References: <1070992528.25344.23.camel@dobblers.nexus.co.uk>
	 <1070995502.24447.2.camel@imladris.demon.co.uk>
	 <1071053801.25344.43.camel@dobblers.nexus.co.uk>
	 <1071054191.5712.204.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Message-Id: <1071061636.25344.70.camel@dobblers.nexus.co.uk>
Mime-Version: 1.0
Date: 10 Dec 2003 13:07:17 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2/nand flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Not fsync() but a flush should happen then, yes.
> 
> Compile with CONFIG_JFFS2_FS_DEBUG=1.  Run 'sync' after writing your
> file. Show me the output.
> 

See extract from kernel log below. Setting FS_DEBUG=1 didn't seem to
produce any more debug info. sync didn't cause a further page write..





Configuring network interfaces: run-parts: failed to open directory
/etc/network/if-pre-up.d: No such file or diyrun-parts: failed to open
directory /etc/network/if-up.d: No such file or directory
done.
Starting syslogd/klogd: gc.c, rawlen=560
jffs2_flash_write, len=560
jffs2_flash_writev, count=1, vecs[0]=560, vecs[1]=0
wbuf_pagesize=512
.....8
.....10, wbuf_len=68, wbuf_pagesize512
thislen=444
invec_ofs=444
donelen=444
wbuf - write_ecc #4, pagesize=512
nand_write_ecc: to = 0x009a3200, len = 512
page=19737, erasesize=16384, oobblock=512, oobsize=16, ecctype=2,
eccsize=256
data = 85 19 02 e0 44 00 00 00 1d fb f7 98 5e 01 00 00
data = 24 00 00 00 a4 81 00 00 00 00 00 00 ee 09 00 00
data = ce 00 00 00 ce 00 00 00 ce 00 00 00 00 00 00 00
data = 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
data = c0 75 8b 99 85 19 02 e0 2d 02 00 00 fa 97 5d dd
data = 1e 03 00 00 03 00 00 00 ed 81 00 00 00 00 00 00
data = 28 04 00 00 c1 00 00 00 b2 9c b2 3f b2 9c b2 3f
data = 00 00 00 00 e9 01 00 00 28 04 00 00 06 00 00 00
data = 75 7a c4 30 03 ec fe e2 78 5e 74 54 4d 8f 9b 30
data = 10 3d af 7f c5 34 a9 7a 2a 18 92 6c 55 b5 da 95
data = a2 55 ab 5e 2a 55 4d 6f d5 2a 6b cc b0 58 05 db
data = c5 26 21 fb eb 77 80 7c 10 92 bd c0 f0 de 63 e6
data = 8d 99 61 fa 8e 27 4a 73 97 33 6c ac a9 3c fc 5a
data = fe f9 71 d7 62 5f b8 eb ae b5 ab 06 11 41 8c a1
data = cc 0d 4c 56 e8 bd d2 cf 50 5b f8 bd fc f9 7d f5
data = 11 6c 81 c2 21 6c 85 f2 61 18 c2 84 95 a6 d6 1e
data = 02 0d dc 56 46 ee 1f 79 a9 3d af 44 99 39 e6 45
data = 05 2f 8d cd 80 87 1d 10 12 10 3e bf 40 f0 00 27
data = 15 dc 03 4f 71 c3 75 5d 14 30 bb ff 10 33 c6 52
data = b4 a5 49 21 10 48 49 53 4a 9e 20 28 2b fe af 73
data = 51 b4 08 16 77 4f 52 f8 be 2e 27 90 77 e0 d3 a5
data = 7a fd be 63 00 ae b4 e5 4c 89 40 a5 95 44 37 61
data = 85 86 c0 f5 56 bc a9 65 ee 64 85 a8 79 d4 43 f9
data = fc 53 14 ad bd 7b 53 56 89 ed b9 92 80 a1 78 23
data = 0f a9 bc df 45 23 26 de d7 f5 bb 78 c4 cc 8e cc
data = 6c c4 cc 8f cc 7c c4 2c 8e cc 62 c4 dc 1e 99 db
data = 21 93 25 07 6f 59 12 b1 29 0c 8f c2 bb 81 ef d5
data = f2 0a 7d 32 bf 5a c6 97 6f 9f 3a 58 2d 67 4c 65
data = f0 17 02 79 f4 41 19 e1 11 be 82 cf 51 b3 9b 29
data = 28 07 4e c4 71 13 41 42 b3 96 b2 9b 33 2f bb 56
data = de 7f 22 bf 7b 88 18 16 0e 47 92 a1 5d 52 64 8a
data = 0d 3b 75 34 b1 29 4f 9d ed b3 50 70 c9 96 aa c1
.....15
old_totlen=116
exiting jffs2_flash_writev, wbuf_len=116, ino=0
done
Starting Secure Shell server: dropbearFailed reading
'/etc/dropbear_rsa_host_key', disabling RSA
.
Starting portmap daemon: portmap.
Starting PCMCIA services: module directory
/lib/modules/2.4.19-rmk7-pxa1/pcmcia not found.
                                                                                                                 
familiar login: root
Password:
~ # sync
~ # pwd
/root
