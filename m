Received: from web51007.mail.yahoo.com ([206.190.38.138])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cs3LV-0001lD-BO
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2005 13:17:23 -0500
Message-ID: <20050121181719.56377.qmail@web51007.mail.yahoo.com>
Date: Fri, 21 Jan 2005 10:17:18 -0800 (PST)
From: Vahid Fereydunkolahi <fereydunk@yahoo.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501210942230.20175@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: Re: Performance of the MTD device and JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I erased the whole flash. I copied a 500KB file to the
NAND flash. Then I copied the file from the NAND flash
to the same directory with different name. This means
read and write operation on empty flash. With the old
version it takes around 2 seconds, with the new
version it takes more than 12 seconds (I am using the
ZLIB for compression).

I wish I had the version iformation of the old MTD and
JFFS2, but I do not (It should be from 4 month ago).

--vahid


> Think would be nice to come with digits.
> Try to profile it.




		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - now with 250MB free storage. Learn more.
http://info.mail.yahoo.com/mail_250
