Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5MKR-0007f8-N7
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 01:10:13 +0000
Received: by mail-pf0-x244.google.com with SMTP id v14so29840309pfd.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 18:09:51 -0700 (PDT)
Date: Mon, 1 May 2017 18:09:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Ludovic Barre <ludovic.Barre@st.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: Document the STM32 QSPI bindings
Message-ID: <20170502010947.GC18576@google.com>
References: <1492103757-22375-1-git-send-email-ludovic.Barre@st.com>
 <1492103757-22375-2-git-send-email-ludovic.Barre@st.com>
 <b62272c9-027c-9c9b-42f0-1056d88aac7c@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b62272c9-027c-9c9b-42f0-1056d88aac7c@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 16, 2017 at 06:53:06PM +0200, Cyrille Pitchen wrote:
> Hi all,
> 
> Rob, is this version ok for you? If so, I can take it into the
> github/spi-nor tree.

I see this was missing from your pull request. Rob has since acked,
so...

Applied to l2-mtd.git
