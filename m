Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZydG-0005LK-VT
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 13:45:00 +0000
Date: Thu, 20 Dec 2018 14:44:37 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Cc: <miquel.raynal@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 3/3] mtd: rawnand: stm32_fmc2: add polling mode
Message-ID: <20181220144437.04a9a694@bbrezillon>
In-Reply-To: <1544781488-18723-4-git-send-email-christophe.kerello@st.com>
References: <1544781488-18723-1-git-send-email-christophe.kerello@st.com>
 <1544781488-18723-4-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 14 Dec 2018 10:58:08 +0100
Christophe Kerello <christophe.kerello@st.com> wrote:

> This patch adds the polling mode, a basic mode that do not need
> any DMA channels. This mode is also useful for debug purpose.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
