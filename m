Received: from wx-out-0506.google.com ([66.249.82.229])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1INVTX-0000qT-WF
	for linux-mtd@lists.infradead.org; Tue, 21 Aug 2007 11:17:02 -0400
Received: by wx-out-0506.google.com with SMTP id s7so1528778wxc
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Aug 2007 08:16:57 -0700 (PDT)
Message-ID: <c0c067900708210816p754adb6s9e045653d04b9189@mail.gmail.com>
Date: Tue, 21 Aug 2007 11:16:57 -0400
From: "Dan Merillat" <harik.attar@gmail.com>
To: "Aras Vaichas" <arasv@magtech.com.au>
Subject: Re: best IO Scheduler for MTD based embedded systems
In-Reply-To: <46CA9C6F.3080604@magtech.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <46CA9C6F.3080604@magtech.com.au>
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If I understand right, MTD isn't block, so it's not using the IO
scheduler at all.  NOP would seem the sanest choice as it serves to
reduce the kernel size.
