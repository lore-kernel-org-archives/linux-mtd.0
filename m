From: David Woodhouse <dwmw2@infradead.org>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <419E1DE0.FDD5DEC0@st.com>
References: <419B8715.4036BDBB@st.com>
	<1100795260.8191.7333.camel@hades.cambridge.redhat.com>
	<419CE1E8.F20DD890@st.com>
	<1100870238.8191.7368.camel@hades.cambridge.redhat.com>
	<419E1DE0.FDD5DEC0@st.com>
Content-Type: text/plain
Date: Sat, 20 Nov 2004 18:57:29 +0000
Message-Id: <1100977049.7949.36.camel@localhost.localdomain>
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
> I feel that writing wbuf immediately adds code without necessity
> (or maybe I'm just too lazy to test it).

The code is there already; it's just a case of making it use wbuf
instead of buf. That shouldn't be so hard.

> Maybe I ought to test nextblock == 0 in addition to the
> obsolete flag to make the exclusion case more precise in
> jffs2_add_physical_node_ref ?

Ah, OK. Yes, that might be appropriate.

> Or is the "dirty" node really necessary ? what happens if we
> don't list it in the raw node refs ?

We'll try writing to that same offset again, and will fail.

-- 
dwmw2
