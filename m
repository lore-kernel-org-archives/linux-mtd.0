Subject: Re: JFFS2: BUG: sleeping function called from invalid context
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <4603E105.3090803@nokia.com>
References: <45FFBCC6.8010800@nokia.com>  <4603E105.3090803@nokia.com>
Content-Type: text/plain
Date: Fri, 23 Mar 2007 14:48:57 +0000
Message-Id: <1174661337.20505.165.camel@pmac.infradead.org>
Mime-Version: 1.0
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

On Fri, 2007-03-23 at 16:15 +0200, Adrian Hunter wrote:
> [nandsim] warning: simulating write failure in page 444
> jffs2_flush_wbuf(): Write failed with -5
> In jffs2_wbuf_recover
> Skipping node at 0x00036000(3)-0x00036950 which is either before 0x00037800 or obsolete
> First node to be recovered is at 0x00036950(2)-0x00037994
> wbuf recover 00036950-00037994 (4164 bytes in 1 nodes)
> Write 0x1000 bytes at 0x00554000 in wbuf recover
> Recovery of wbuf succeeded to 00554000
> Refiling block of 00001044 at 00036950(2) to 00554000
> calling jffs2_gc_fetch_inode
> wbuf recovery completed OK. wbuf_ofs 0x00555000, len 0x44
> Write of 1548 bytes at 0x00037994 failed. returned -5, retlen 0
> Not marking the space at 0x00037994 as dirty because the flash driver returned retlen zero
> JFFS2 warning: (3229) jffs2_sum_write_sumnode: Empty summary info!!!
> ------------[ cut here ]------------
> kernel BUG at fs/jffs2/summary.c:824! 

Hm. What block was it trying to retire? Surely not the "bad" block at
0x36000 (page 444) but the block it recovered _to_, at 0x554000?

Can you show that again with a full CONFIG_JFFS2_FS_DEBUG=1 log for the
period in question?

Instrumenting the code to dump the raw node list for the eraseblock in
question before triggering the BUG() would also be useful.

-- 
dwmw2
