Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW5tz-0002Mf-Fv
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 16:24:04 +0000
Received: by iegc3 with SMTP id c3so49012702ieg.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2015 09:23:40 -0700 (PDT)
In-Reply-To: <OFDCFAD872.747A8A9B-ON48257E05.002FA55F-48257E06.000A13B0@zte.com.cn>
References: <OFDCFAD872.747A8A9B-ON48257E05.002FA55F-48257E06.000A13B0@zte.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: JFFS2: unaligned accesses may happen in jffs2_sum_process_sum_data
From: Nicholas Krause <xerofoify@gmail.com>
Date: Thu, 12 Mar 2015 12:23:27 -0400
To: wang.bo116@zte.com.cn,linux-mtd@lists.infradead.org,dwmw2@infradead.org
Message-ID: <A3BA58D2-27E5-423A-97FE-F193367A6E03@gmail.com>
Cc: deng.chao1@zte.com.cn, wang.haitao1@zte.com.cn, liu.song11@zte.com.cn,
 cui.yunfeng@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On March 11, 2015 9:50:01 PM EDT, wang.bo116@zte.com.cn wrote:
>
>	In JFFS2 summary, "#define JFFS2_SUMMARY_DIRENT_SIZE(x) (sizeof(struct
>jffs2_sum_dirent_flash) + (x))",because of x here is dir's name, the
>result of JFFS2_SUMMARY_DIRENT_SIZE may be unaligned. So in function
>"jffs2_sum_process_sum_data", may access unaligned pointer "sp" when
>excute "switch (je16_to_cpu(((struct jffs2_sum_unknown_flash
>*)sp)->nodetype))".
>
>	Some machine not allowed unaligned accesses, for example, in linux
>mips systerms, unaligned accesses may cause a exception,but luckly,in
>linux, function "handle_adel" can handle it well.But when JFFS2 use in
>other operating systerm, this unaligned accesses may be a problem.
>
>	To fix it,the simple way is redefine JFFS2_SUMMARY_DIRENT_SIZE like
>"#define JFFS2_SUMMARY_DIRENT_SIZE(x) PAD((sizeof(struct
>jffs2_sum_dirent_flash) + (x)))",make it aligned.But the problem is
>that SUMMARY became incompatible!
>
>
>
>
>Are you stating that this is a build issue or causing a bug with hardware that needs this marco unaligned. 
Nick 
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
