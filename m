Received: from nz-out-0102.google.com ([64.233.162.203])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FjGBZ-0007UR-7u
	for linux-mtd@lists.infradead.org; Thu, 25 May 2006 09:47:40 -0400
Received: by nz-out-0102.google.com with SMTP id q3so1664374nzb
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 May 2006 06:47:31 -0700 (PDT)
Message-ID: <4475B575.1070903@gmail.com>
Date: Thu, 25 May 2006 08:47:33 -0500
From: Nishanth Menon <menon.nishanth@gmail.com>
MIME-Version: 1.0
To: Davide CASCONE <davide.cascone@st.com>
References: <001501c67fd4$b50e37c0$253682a4@nap.st.com>
In-Reply-To: <001501c67fd4$b50e37c0$253682a4@nap.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Control Mode Program on Sibley
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Davide CASCONE wrote:
> Does JFFS2 use the Control Mode Program on Sibley device? After a my preliminary analysis, it seems that only the Object Mode Program is used. Is it right?
> 
That is correct Davide. the reason for that is that in Control mode, one
of the A/B halfs cannot be written, in short we only get 16 bits of
contiguous data in memory.

The neagitve part of using only Object mode is that Of the programming
regions/sector, we loose one complete region for the cleanmarker..
something like 128K(? dont remember off hand) for 8/12 bytes of
cleanmarker/EBH and hence the implementation using write buffering
(something we do on nand-like flash devices) on M18 flashes.

Regards,
Nishanth Menon
