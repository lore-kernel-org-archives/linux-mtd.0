Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CElAO-0006AG-Kj
	for linux-mtd@lists.infradead.org; Tue, 05 Oct 2004 04:59:30 -0400
Date: Tue, 5 Oct 2004 11:59:19 +0300 (EEST)
From: Kalev Lember <kalev@colleduc.ee>
To: Nicolas Pouillon <nipo@ssji.net>
In-Reply-To: <20041004215001.769d8017.nipo@ssji.net>
Message-ID: <Pine.LNX.4.44.0410051152070.2033-100000@kiire.colleduc.ee>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Probing at 0x0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 4 Oct 2004, Nicolas Pouillon wrote:

> This time, chip is probed as a DoC-Mil+ 32MB, driver complains about it

I believe it is detected correctly. The Diskonchip Millennium Plus 64MB is 
actually two 32 MB devices stacked up.

> not being supported. It seems ok, and as mtd are much like rocket
> science to me, I'll wait a little until it is (i hope) supported...

I reimplemented the Diskonchip Millennium Plus support in the new driver, 
but unfortunately I have only 16MB pieces at hand.

-- 
Best regards,
Kalev Lember
