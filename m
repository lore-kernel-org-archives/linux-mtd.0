Received: from lon-del-01.spheriq.net ([195.46.50.97])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DIS6M-0003pR-8W
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2005 09:59:00 -0400
Received: from lon-out-02.spheriq.net ([195.46.50.130])
	by lon-del-01.spheriq.net with ESMTP id j34Dwoah006497
	for <linux-mtd@lists.infradead.org>; Mon, 4 Apr 2005 13:58:50 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-02.spheriq.net with ESMTP id j34Dwo8r016518
	for <linux-mtd@lists.infradead.org>; Mon, 4 Apr 2005 13:58:50 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <42514815.AD64923B@st.com>
Date: Mon, 04 Apr 2005 15:58:45 +0200
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <419B8715.4036BDBB@st.com>	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>	<419CE1E8.F20DD890@st.com>	<1100870238.8191.7368.camel@hades.cambridge.redhat.com>	<419E1DE0.FDD5DEC0@st.com>	<1100978366.7949.38.camel@localhost.localdomain>	<1100988787.7949.46.camel@localhost.localdomain>	<1102604262.6694.17.camel@hades.cambridge.redhat.com>	<41B88622.4BCD78EC@st.com>
	<41C02F29.92D2B5A@st.com> <425139E8.5000508@yandex.ru>
Content-Type: text/plain; charset=us-ascii
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

Hi Artem,

I ran the deadlock test with your patch and did not
observe any deadlock nor any other problem.


> -                       ret = jffs2_flash_read(c, ofs, readlen, &retlen, ebuf);
> +                       if (!jffs2_is_writebuffered(c) || !jffs2_cleanmarker_oob(c))
> +                               ret = c->mtd->read(c->mtd, ofs, readlen, &retlen, ebuf);
> +                       else
> +                               ret = c->mtd->read_ecc(c->mtd, ofs, readlen, &retlen, ebuf, NULL, c->oobinfo);
> +
>                         if (ret) {
>                                 printk(KERN_WARNING "Read of newly-erased block at 0x%08x failed: %d. Putting on bad_list\n", ofs, ret);
>                                 goto bad;


However I don't use MTD drivers, and I have no ECC 
implementation so far, so I don't know whether 
read_ecc could return an error (maybe EBADMSG) when 
it finds that the page and OOB are all FF.
Maybe just calling mtd->read unconditionally is 
good here ?

bye
Estelle
