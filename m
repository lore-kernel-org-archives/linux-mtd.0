Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CQ03l-0003YD-3l
	for linux-mtd@lists.infradead.org; Fri, 05 Nov 2004 04:07:20 -0500
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <418B42AF.4457A6FD@st.com>
Date: Fri, 05 Nov 2004 10:06:55 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
References: <417F961A.1090107@yandex.ru>		<1098881953.13633.1786.camel@hades.cambridge.redhat.com>		<417FA408.9080906@yandex.ru>	<1098884706.13633.1791.camel@hades.cambridge.redhat.com>		<4180E732.70608@yandex.ru>
	<4180FAD8.2000107@yandex.ru> <41879A58.F960F963@st.com>
	<41890762.9030901@yandex.ru> <4189F07F.6495F568@st.com>
	<4189F823.2060204@yandex.ru> <418A591C.A4D46C9E@st.com>
	<418A643B.2070806@yandex.ru>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 & SMP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

you are right of course. The patch I proposed would only make sense
in a very specific environment which is very different from the
way JFFS2 and linux work. So you can forget about my previous message.
I guess there is no way around using a mutex.

Estelle


"Artem B. Bityuckiy" wrote:
> 
> Estelle,
> 
> I don't cleanly understand your Idea, I'll think more.
> 
> Could you please answer: does it handle the following "use-case" (if
> yes, how?):
> 
> Suppose we are reading node, which is in the wbuf so far.
> 
> int jffs2_flash_read(struct jffs2_sb_info *c, loff_t ofs, size_t len,
> size_t *retlen, u_char *buf)
> {
>          loff_t  orbf = 0, owbf = 0, lwbf = 0;
>          int     ret;
> 
>          /* Read flash */
>          if (!jffs2_can_mark_obsolete(c)) {
>                  ret = c->mtd->read_ecc(c->mtd, ofs, len, retlen, buf,
> NULL, c->oobinfo);
> 
>                  if ( (ret == -EBADMSG) && (*retlen == len) ) {
>                          printk(KERN_WARNING "mtd->read(0x%zx bytes from
> 0x%llx) returned ECC error\n",
>                                 len, ofs);
>                          /*
>                           * We have the raw data without ECC correction
> in the buffer, maybe
>                           * we are lucky and all data or parts are
> correct. We check the node.
>                           * If data are corrupted node check will sort
> it out.
>                           * We keep this block, it will fail on write or
> erase and the we
>                           * mark it bad. Or should we do that now? But
> we should give him a chance.
>                           * Maybe we had a system crash or power loss
> before the ecc write or
>                           * a erase was completed.
>                           * So we return success. :)
>                           */
>                          ret = 0;
>                   }
>          } else
>                  return c->mtd->read(c->mtd, ofs, len, retlen, buf);
> /*________________________
> Suppose the page we have read is empty because of its data is still in
> wbuf. We have read all 0xFF. Suppose we are preempted at this point.
> Somebody else made write, the wbuf became full and was flushed to the
> correspondent flash page. Then we wake up. We see, the wbuf_len == 0.
> And we exit. Result: we have read all 0xFF instead of node....
> ________________________*/
> 
>          /* if no writebuffer available or write buffer empty, return */
>          if (!c->wbuf_pagesize || !c->wbuf_len)
>                  return ret; /* <---------------------- we exit here.... */
> 
>          /* if we read in a different block, return */
>          if ( (ofs & ~(c->sector_size-1)) != (c->wbuf_ofs &
> ~(c->sector_size-1)) )
>                  return ret;
> 
>          if (ofs >= c->wbuf_ofs) {
>                  owbf = (ofs - c->wbuf_ofs);     /* offset in write
> buffer */
>                  if (owbf > c->wbuf_len)         /* is read beyond write
> buffer ? */
>                          return ret;
>                  lwbf = c->wbuf_len - owbf;      /* number of bytes to
> copy */
>                  if (lwbf > len)
>                          lwbf = len;
>          } else {
>                  orbf = (c->wbuf_ofs - ofs);     /* offset in read buffer */
>                  if (orbf > len)                 /* is write beyond
> write buffer ? */
>                          return ret;
>                  lwbf = len - orbf;              /* number of bytes to
> copy */
>                  if (lwbf > c->wbuf_len)
>                          lwbf = c->wbuf_len;
>          }
>          if (lwbf > 0)
>                  memcpy(buf+orbf,c->wbuf+owbf,lwbf);
> 
>          return ret;
> }
>
