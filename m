From: David Woodhouse <dwmw2@infradead.org>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <42524FBD.C418A0E6@st.com>
References: <20050404135849.4689.qmail@web52705.mail.yahoo.com>
	<loom.20050404T173154-376@post.gmane.org>
	<1112640934.24487.375.camel@hades.cambridge.redhat.com>
	<loom.20050404T224215-1@post.gmane.org>  <42524FBD.C418A0E6@st.com>
Content-Type: text/plain
Date: Tue, 05 Apr 2005 10:27:30 +0100
Message-Id: <1112693250.4397.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 and frequent/small write operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-04-05 at 10:43 +0200, Estelle HAMMACHE wrote:
> Sorry for the confusion... I'm glad this erroneous notion
> is corrected.

Actually -- looking briefly at generic_osync_inode(), I'm not entirely
convinced that we _do_ correctly flush after an O_SYNC write. Do we need
to set I_DIRTY_DATASYNC when we have outstanding data in the wbuf, and
implement write_inode() to make it get flushed?

-- 
dwmw2
