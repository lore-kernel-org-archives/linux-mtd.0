Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CUTvR-000850-02
	for linux-mtd@lists.infradead.org; Wed, 17 Nov 2004 12:49:04 -0500
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <419B8EFF.17DCE55B@st.com>
Date: Wed, 17 Nov 2004 18:48:47 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: simon@baydel.com
References: <6BEF91EC1C3A@baydel.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: oops line 231 of latest readinode.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Simon Haynes wrote:
> newfrag->ofs)' and then in the next if as newfrag->ofs contains -1. The oops

It seems very strange that newfrag->ofs contains -1. If you can reproduce
it could you check where it was filled with this strange value ?

Estelle
