Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8V78-0003Ge-PW
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 08:01:01 +0000
Subject: Re: [PATCH] UBIFS: Add an error code if the compr is not present
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00905250052i6e04efd3j27eeaf35f0495f7f@mail.gmail.com>
References: <1243234150-29786-1-git-send-email-corentincj@iksaif.net>
	<1243236757.21646.54.camel@localhost.localdomain>
	<71cd59b00905250052i6e04efd3j27eeaf35f0495f7f@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 May 2009 11:00:44 +0300
Message-Id: <1243238444.21646.65.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-05-25 at 09:52 +0200, Corentin Chary wrote:
> For information, this bug was triggered when running an userspace
> version of ubifs (code available soon).
> We used the original ubifs to format the partition, but our version
> didn't support the lzo compressor (now, it do).
> Then, valgrind/gdb to get a backtrace and "voila".

Userspace ubifs version. Wow! I wonder how it performs comparing
to the kernel space one.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
