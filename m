From: David Woodhouse <dwmw2@infradead.org>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <419E1DE0.FDD5DEC0@st.com>
References: <419B8715.4036BDBB@st.com>
	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>
	<419CE1E8.F20DD890@st.com>
	<1100870238.8191.7368.camel@hades.cambridge.redhat.com>
	<419E1DE0.FDD5DEC0@st.com>
Content-Type: text/plain
Date: Sat, 20 Nov 2004 19:19:26 +0000
Message-Id: <1100978366.7949.38.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 & NAND failure
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-11-19 at 17:22 +0100, Estelle HAMMACHE wrote:
> 
> Here is an example of the obsolete node/refiled nextblock pb:
> - page size 512 bytes
> - start condition: wbuf contains 500 bytes
> jffs2_write_dnode call, total node size 700 bytes
> -->jffs2_flash_writev
> ------>fill up wbuf
> ------>donelen = 12
> ------>jffs2_flush_wbuf (succeeds)
> ------>c->mtd->writev_ecc to write 1 page - fails
> ------>nextblock is refiled (new code!)
> ------>*retlen = donelen   (= 12)
> -->add obsolete frag for dirtied space 
> ------> free raw node & return early because c->nextblock == 0
> -->probable segfault on (redundant?) jffs2_mark_node_obsolete
> -->retry.

This is the problem, surely? If we've refiled the nextblock, we should
return retlen == 0.

-- 
dwmw2
