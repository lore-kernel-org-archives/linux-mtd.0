Received: from web51014.mail.yahoo.com ([206.190.39.79])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EjpcD-0003UP-TD
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2005 22:05:14 -0500
Message-ID: <20051207025829.96686.qmail@web51014.mail.yahoo.com>
Date: Tue, 6 Dec 2005 18:58:29 -0800 (PST)
From: Vahid Fereydunkolahi <fereydunk@yahoo.com>
To: alfred hitch <alfred.hitch@gmail.com>
In-Reply-To: <29f916510512061842r3bfe6cbj7cd251bea8f5d39e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: file corruption with mtd / jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In our case the data is perfectly fine on the flash,
but gets corruped in the memory.
I noticed that when I copy the binary files, and I
enable the debugging, sometimes I get the following
message:
"Filling non-frag hole from 7000-8192 ( inod 1323,
size 1192)"

Why should a complete copy of a file has a non-frag
hole?

--vahid

By the way, Is the data corruption in your case caused
on the NAND or in the memory?


		
__________________________________________ 
Yahoo! DSL – Something to write home about. 
Just $16.99/mo. or less. 
dsl.yahoo.com 
