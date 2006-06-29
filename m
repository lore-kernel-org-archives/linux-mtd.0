Received: from nf-out-0910.google.com ([64.233.182.188])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FvvBt-0005JO-1Q
	for linux-mtd@lists.infradead.org; Thu, 29 Jun 2006 08:00:43 -0400
Received: by nf-out-0910.google.com with SMTP id d4so48254nfe
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Jun 2006 05:00:05 -0700 (PDT)
Message-ID: <fe810cf0606290500h54295e34jbb018a5346dceb6a@mail.gmail.com>
Date: Thu, 29 Jun 2006 16:00:05 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: JFFS2 wbuf non-contiguous write bug
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

"Non-contiguous write" bug appears in jffs2_flash_writev() function
(JFFS2 mounted on Sibley). It seems the reason is "wbuf fixup" code
removed from wbuf.c with this commit

"[MTD] Merge STMicro NOR_ECC code with Intel Sibley code"
http://kernel.org/git/?p=linux/kernel/git/dwmw2/mtd-2.6.git;a=commit;h=c8b229de2b05c2b3e8d282ce260935a88ac030ca

The following lines were removed there

		if (((c->wbuf_ofs % c->sector_size) == 0) && !c->wbuf_len) {
			c->wbuf_ofs = PAGE_DIV(to);
			c->wbuf_len = PAGE_MOD(to);
			memset(c->wbuf,0xff,c->wbuf_pagesize);
		}

Getting that code back fixes the problem.

One may notice that there is another "new eraseblock" check left in
jffs2_flash_writev()

	if (SECTOR_ADDR(to) != SECTOR_ADDR(c->wbuf_ofs)) { ...

But it is not enough since SECTOR_ADDR(to) and
SECTOR_ADDR(c->wbuf_ofs) could be the same here even in case of moving
to a new eraseblock.

Am I missing something or "wbuf fixup" code should be indeed restored?

Thanks,
Alexander Belyakov
