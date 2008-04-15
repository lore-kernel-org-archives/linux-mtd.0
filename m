Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jll0N-0003jC-3K
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 13:15:23 +0000
Message-ID: <4804A8EA.3070608@nokia.com>
Date: Tue, 15 Apr 2008 16:08:58 +0300
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
> ( wchan gives the function the process is currently executing ).

A better way is to dump the task list to the console, which you can probably do like this:

	sudo echo t > /proc/sysrq-trigger

	dmesg > my_console_messages.txt

(More information in the kernel source in Documentation/sysrq.txt or search the internet for "sysrq")

Then send us my_console_messages.txt
