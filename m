Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DISsY-0004RI-Mj
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2005 10:48:40 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <42514815.AD64923B@st.com>
References: <419B8715.4036BDBB@st.com>
	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>
	<419CE1E8.F20DD890@st.com>
	<1100870238.8191.7368.camel@hades.cambridge.redhat.com>
	<419E1DE0.FDD5DEC0@st.com>	<1100978366.7949.38.camel@localhost.localdomain>
	<1100988787.7949.46.camel@localhost.localdomain>
	<1102604262.6694.17.camel@hades.cambridge.redhat.com>
	<41B88622.4BCD78EC@st.com> <41C02F29.92D2B5A@st.com>
	<425139E8.5000508@yandex.ru>  <42514815.AD64923B@st.com>
Content-Type: text/plain
Date: Mon, 04 Apr 2005 18:47:57 +0400
Message-Id: <1112626077.19212.1.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 & NAND failure
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-04-04 at 15:58 +0200, Estelle HAMMACHE wrote:
> However I don't use MTD drivers, and I have no ECC 
> implementation so far, so I don't know whether 
> read_ecc could return an error (maybe EBADMSG) when 
> it finds that the page and OOB are all FF.
It should be fine.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
