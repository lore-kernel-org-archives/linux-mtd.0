Received: from fra-del-01.spheriq.net ([195.46.51.97])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CeYMF-0002gZ-VM
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 07:34:22 -0500
Received: from fra-inc-07.spheriq.net (fra-inc-07.spheriq.net [195.46.51.71])
	by fra-del-01.spheriq.net with ESMTP id iBFCYFt4026216
	for <linux-mtd@lists.infradead.org>; Wed, 15 Dec 2004 12:34:15 GMT
Received: from fra-out-02.spheriq.net (fra-out-02.spheriq.net [195.46.51.130])
	by fra-inc-07.spheriq.net with ESMTP id iBFCYFR1030380
	for <linux-mtd@lists.infradead.org>; Wed, 15 Dec 2004 12:34:15 GMT
Received: from fra-cus-02.spheriq.net (fra-cus-02.spheriq.net [195.46.51.38])
	by fra-out-02.spheriq.net with ESMTP id iBFCXvKC030847
	for <linux-mtd@lists.infradead.org>; Wed, 15 Dec 2004 12:33:57 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by fra-cus-02.spheriq.net with ESMTP id iBFCXujJ009986
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Wed, 15 Dec 2004 12:33:57 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44A97DA41
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2004 12:33:54 +0000 (GMT)
Received: from zeta.dmz-eu.st.com (localhost [127.0.0.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7EBF75969
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2004 12:34:21 +0000 (UTC)
Received: from mail1.clb.st.com (mail1.clb.st.com [164.129.68.17])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8906347271
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2004 12:34:21 +0000 (GMT)
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <41C02F29.92D2B5A@st.com>
Date: Wed, 15 Dec 2004 13:33:45 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <419B8715.4036BDBB@st.com>
	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>
	<419CE1E8.F20DD890@st.com>
	<1100870238.8191.7368.camel@hades.cambridge.redhat.com>
	<419E1DE0.FDD5DEC0@st.com>
	<1100978366.7949.38.camel@localhost.localdomain>
	<1100988787.7949.46.camel@localhost.localdomain>
	<1102604262.6694.17.camel@hades.cambridge.redhat.com>
	<41B88622.4BCD78EC@st.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2 & NAND failure
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everyone,

it seems there is a problem with jffs2_wbuf_recover and
the wbuf_sem...

jffs2_flash_writev
** down_write(&c->wbuf_sem);  !!!
** __jffs2_flush_wbuf
**** jffs2_wbuf_recover
******  jffs2_block_refile
********  nextblock = NULL;
******  jffs2_reserve_space_gc
********  jffs2_do_reserve_space
**********  jffs2_erase_pending_blocks
************  jffs2_mark_erased_block
**************  jffs2_flash_read
****************  down_read(&c->wbuf_sem); !!!

I believe that when checking a newly erased block, the
wbuf should not be used anyway, so this is probably easy to
correct. Is it ok to create a jffs2_flash_read_nobuf function
and call it only from jffs2_mark_erased_block ?

Also, still looking at the same recovery scheme, I believe
the following could happen if there are no free or erasing
blocks (but is it really possible ???)

jffs2_flash_writev
** __jffs2_flush_wbuf
**** jffs2_wbuf_recover
******  jffs2_block_refile
********  nextblock = NULL;
******  jffs2_reserve_space_gc
********  jffs2_do_reserve_space
********** jffs2_flush_wbuf_pad
************  __jffs2_flush_wbuf

bye
Estelle
