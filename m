Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EmsAV-0000Sj-OT
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2005 07:25:13 -0500
Message-ID: <43A1609C.80705@imc-berlin.de>
Date: Thu, 15 Dec 2005 13:25:00 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
References: <43A1418F.3060701@imc-berlin.de>
	<20051215102607.GA20431@angel.research.nokia.com>
In-Reply-To: <20051215102607.GA20431@angel.research.nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Do I have to umount JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jarkko Lavinen wrote:
> On Thu, Dec 15, 2005 at 11:12:31AM +0100, ext Steven Scholz wrote:
> 
>>Now I wonder if it is needed to umount this partition explicitly before
>>rebooting? Or mount it read only first by having
> 
> 
> JFFS2 is synhronous except for the write buffer (used with Nand chips).  
> Doing sync is enough and flushes the write buffer.

Is "sync()" done by the kernel before reboot? Or do I have to call "sync"?

--
Steven
