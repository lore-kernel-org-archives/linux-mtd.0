Received: from rubin.euroweb.hu ([193.91.90.74] helo=imap.rubin.hu)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CEp8b-0007Lm-V1
	for linux-mtd@lists.infradead.org; Tue, 05 Oct 2004 09:13:55 -0400
Message-ID: <41629E04.3000405@rubin.hu>
Date: Tue, 05 Oct 2004 15:13:40 +0200
From: Robert Szabo <robbie@rubin.hu>
MIME-Version: 1.0
To: Lorenzo PARISI <lorenzo.parisi@st.com>
References: <35c66fec.8a805a46.81a3300@mail1.agr.st.com>
In-Reply-To: <35c66fec.8a805a46.81a3300@mail1.agr.st.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
	YAFFS mailing list <yaffs@stoneboat.aleph1.co.uk>
Subject: Re: [Yaffs] /proc
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lorenzo PARISI wrote:

>Hi,
>
>I've a s3c2410 board with BAST architecture.
>On board, I've a kernel 2.6.9-rc2-bk13.
>I've compiled the kernel with CONFIG_PROC_FS = YES;
>but the directory /proc is empty, why?
>Thus, I don't see mtd information.
>
>Thanks.
>
>_______________________________________________
>yaffs mailing list
>yaffs@stoneboat.aleph1.co.uk
>http://stoneboat.aleph1.co.uk/cgi-bin/mailman/listinfo/yaffs
>  
>

Try mount it with:
mount -t proc / /proc

regards,
Robbie
