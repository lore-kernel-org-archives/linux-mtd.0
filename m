From: David Woodhouse <dwmw2@infradead.org>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <1100988787.7949.46.camel@localhost.localdomain>
References: <419B8715.4036BDBB@st.com>
	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>
	<419CE1E8.F20DD890@st.com>
	<1100870238.8191.7368.camel@hades.cambridge.redhat.com>
	<419E1DE0.FDD5DEC0@st.com>
	<1100978366.7949.38.camel@localhost.localdomain>
	<1100988787.7949.46.camel@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 09 Dec 2004 14:57:41 +0000
Message-Id: <1102604262.6694.17.camel@hades.cambridge.redhat.com>
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

On Sat, 2004-11-20 at 22:13 +0000, David Woodhouse wrote:
> On Sat, 2004-11-20 at 19:19 +0000, David Woodhouse wrote:
> > This is the problem, surely? If we've refiled the nextblock, we should
> > return retlen == 0.
> 
> Can you try this patch against current CVS? I've already split the
> refiling off into a separate function we can call, and I've also fixed
> it to write from the wbuf if it's full.

Any progress? If it's working and you agree it's sufficient then we
should commit it.

-- 
dwmw2
