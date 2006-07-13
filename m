Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0xLr-0002tv-JH
	for linux-mtd@lists.infradead.org; Thu, 13 Jul 2006 05:19:29 -0400
Message-ID: <44B6101F.8070408@ru.mvista.com>
Date: Thu, 13 Jul 2006 13:19:27 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: M Sudharshana-A18475 <sudharshana@motorola.com>
Subject: Re: Nand read/write
References: <B7803DC652E2F9458758AEBB6A5FD60FF88D90@ZMY16EXM67.ds.mot.com>
In-Reply-To: <B7803DC652E2F9458758AEBB6A5FD60FF88D90@ZMY16EXM67.ds.mot.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

M Sudharshana-A18475 wrote:
> I have the following scenario on an embedded Linux application.
>
> There is a partition in the NAND flash memory (with RAW type, no file
> system), which will be mounted and used for read/write. As an
> application which performs "read"/"write" on this partition after
> mounting, should it be assumed that "bad block algorithm" is covered? Or
> application has to handle the same?
>   
Can you please explain the term "mounted" for raw flash case you're 
talking about?

Thx,
   Vitaly
