From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
In-Reply-To: <42429C1C.8050600@yandex.ru>
References: <loom.20050322T224733-491@post.gmane.org>
	<4241396B.D689EB32@st.com> <loom.20050323T212715-407@post.gmane.org>
	<4242925F.D29BC7CE@st.com>  <42429C1C.8050600@yandex.ru>
Content-Type: text/plain
Date: Thu, 24 Mar 2005 22:00:59 +0000
Message-Id: <1111701659.6588.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: atomic file operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-24 at 13:53 +0300, Artem B. Bityuckiy wrote:
> then you have the guarantee that you either have written all or 
> nowthing. JFFS2 does guarantee that due to its implementation.

JFFS2 might happen to _do_ that due to its implementation, but it's not
a guarantee. POSIX doesn't require that writes are atomic w.r.t power
failure.

-- 
dwmw2
