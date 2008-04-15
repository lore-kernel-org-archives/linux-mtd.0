Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jll6q-0004XS-S1
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 13:22:05 +0000
Message-ID: <4804AAE5.9060609@nokia.com>
Date: Tue, 15 Apr 2008 16:17:25 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext rohit h <hrohit85@gmail.com>
Subject: Re: [JFFS2] Running fsstress on JFFS2 causing freeze
References: <90d987c0804150511v7063ebcdx8e769c6c20161899@mail.gmail.com>
In-Reply-To: <90d987c0804150511v7063ebcdx8e769c6c20161899@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

rohit h wrote:
> Hello everyone.
> I am running a filesystem testing application "fsstress" on JFFS2.
> The JFFS2 code is from linux-2.6.22 kernel.All the processes spawned
> by fsstress do filesystem operations on the JFFS2 partition.After some
> time all the processes go into "UNINTERRUPTIBLE SLEEP" state as shown.

It is probably the same issue described here:

http://lists.infradead.org/pipermail/linux-mtd/2008-April/021039.html
