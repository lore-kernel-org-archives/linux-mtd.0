Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CErc7-0000D1-Pe
	for linux-mtd@lists.infradead.org; Tue, 05 Oct 2004 11:52:32 -0400
Date: Tue, 5 Oct 2004 11:45:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Lorenzo PARISI <lorenzo.parisi@st.com>
In-Reply-To: <35c66fec.8a805a46.81a3300@mail1.agr.st.com>
Message-ID: <Pine.LNX.4.60.0410051145220.4850@dell.enoriver.com>
References: <35c66fec.8a805a46.81a3300@mail1.agr.st.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
	YAFFS mailing list <yaffs@stoneboat.aleph1.co.uk>
Subject: Re: /proc
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 5 Oct 2004, Lorenzo PARISI wrote:

> Hi,
>
> I've a s3c2410 board with BAST architecture.
> On board, I've a kernel 2.6.9-rc2-bk13.
> I've compiled the kernel with CONFIG_PROC_FS = YES;
> but the directory /proc is empty, why?
> Thus, I don't see mtd information.

i think you still have to mount it at boot time.

rday
