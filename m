Received: from mx7.zte.com.cn ([202.103.147.169] helo=zte.com.cn)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVsGj-0006Ts-1F
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 01:50:38 +0000
Subject: JFFS2: unaligned accesses may happen in jffs2_sum_process_sum_data
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Message-ID: <OFDCFAD872.747A8A9B-ON48257E05.002FA55F-48257E06.000A13B0@zte.com.cn>
From: wang.bo116@zte.com.cn
Date: Thu, 12 Mar 2015 09:50:01 +0800
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: cui.yunfeng@zte.com.cn, wang.haitao1@zte.com.cn, liu.song11@zte.com.cn,
 deng.chao1@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


	In JFFS2 summary, "#define JFFS2_SUMMARY_DIRENT_SIZE(x) (sizeof(struct jffs2_sum_dirent_flash) + (x))",because of x here is dir's name, the result of JFFS2_SUMMARY_DIRENT_SIZE may be unaligned. So in function "jffs2_sum_process_sum_data", may access unaligned pointer "sp" when excute "switch (je16_to_cpu(((struct jffs2_sum_unknown_flash *)sp)->nodetype))".

	Some machine not allowed unaligned accesses, for example, in linux mips systerms, unaligned accesses may cause a exception,but luckly,in linux, function "handle_adel" can handle it well.But when JFFS2 use in other operating systerm, this unaligned accesses may be a problem.

	To fix it,the simple way is redefine JFFS2_SUMMARY_DIRENT_SIZE like "#define JFFS2_SUMMARY_DIRENT_SIZE(x) PAD((sizeof(struct jffs2_sum_dirent_flash) + (x)))",make it aligned.But the problem is that SUMMARY became incompatible!
