Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LMkNv-0006nA-Mw
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2009 14:36:54 +0000
Message-ID: <496CA6FB.1030806@users.sourceforge.net>
Date: Tue, 13 Jan 2009 15:36:43 +0100
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: joakim.tjernlund@transmode.se
Subject: Re: BUG in JFFS2 kernel 2.6.27
References: <OFB0D82DEF.AEFFD688-ONC125753D.0045FF81-C125753D.004A3AF2@transmode.se>
In-Reply-To: <OFB0D82DEF.AEFFD688-ONC125753D.0045FF81-C125753D.004A3AF2@transmode.se>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

joakim.tjernlund@transmode.se wrote:
> Just got this BUG:
> 
> Data CRC 22c90447 != calculated CRC cbf47f8b for node at 07d2aadc
> ------------[ cut here ]------------
> kernel               BUG               at              fs/jffs2/file.c:251!
> Oops:      Exception      in      kernel      mode,     sig:     5     [#1]
> TMCUTU
> NIP:        c00eb5d0        LR:        c004ab34        CTR:        c00eb57c
> REGS:      ce217bf0      TRAP:     0700       Not     tainted      (2.6.27)
> MSR:     00029032    <EE,ME,IR,DR>     CR:    24022422     XER:    00000000
> TASK       =       ce1d6800[424]      'ne_swumd'      THREAD:      ce216000
> GPR00:  00000001  ce217ca0  ce1d6800  ce296520  cf51b708  00000000 002a6000
> 00001000
> GPR08:  00001000  00000000  c016bac4  cf86f600  00400000  10069018 10060000
> 00000000
> GPR16:  002a6000  00000000  00000000  c021010c  00000000  ce296520 cf86f400
> cf51b648
> GPR24:  00000000  00001000  00000000  002a6000  00000000  cf51b670 ce216000
> c0441820
> NIP                  [c00eb5d0]                  jffs2_write_end+0x54/0x228
> LR            [c004ab34]            generic_file_buffered_write+0x178/0x634
> Call                                                                 Trace:
> [ce217ca0]       [c016aa94]       release_sock+0x94/0xa8       (unreliable)
> [ce217ce0]        [c004ab34]        generic_file_buffered_write+0x178/0x634
> [ce217d70]      [c004b394]      __generic_file_aio_write_nolock+0x3a4/0x568
> [ce217df0]           [c004b6b0]           generic_file_aio_write+0x68/0x120
> [ce217e20]                [c006a1a4]               do_sync_write+0xc8/0x13c
> [ce217ef0]                  [c006a2b4]                 vfs_write+0x9c/0x174
> [ce217f10]                  [c006a468]                  sys_write+0x4c/0x90
> [ce217f40]               [c000f3ec]               ret_from_syscall+0x0/0x38
> --- Exception: c01 at 0xf9c1744
>     LR = 0x1003ce20
> Instruction dump:
> 83a40000 7f384214 54dc053a 817d008c 82cb019c 92e10008 3afdffd8 80090000
> 70090008  41820004  7c000026 54001ffe <0f000000> 6b291000 7d2bfe70 7d604a78
> ---[ end trace 79c27f7a1b03cf81 ]---
> 
> Anyone seen something similar?

I think it's this one again:
http://lists.infradead.org/pipermail/linux-mtd/2008-April/021473.html

The patch in the above post avoids this BUG_ON by aborting early when the dnode
read fails and propagates an error code back to userspace and thus avoids this path to be taken.

I didn't pursue it since I was unsure whether it would remove some
self-healing properties of the design in non-debug builds.
