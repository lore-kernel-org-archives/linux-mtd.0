Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Be18-0002KW-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Dec 2001 15:31:26 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0112051523540.27871-100000@infradead.org> 
References: <Pine.LNX.4.33.0112051523540.27871-100000@infradead.org> 
To: ilatypov@infradead.org
Cc: Mike Ruthven <mike@creonova.com>, linux-mtd@lists.infradead.org
Subject: Re: nftl 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Dec 2001 15:41:32 +0000
Message-ID: <15764.1007566892@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

ilatypov@infradead.org said:
>  I encountered the same with an M-Sys-pre-formatted DOC chip.  It
> seems that the existing MTD code will work only after re-formatting
> the chip with the nftl_format.  Correct me if I am wrong.

Shouldn't take much to make that format work with our NFTL code. Again, 
it's disabled mostly because it's not tested.

--
dwmw2
