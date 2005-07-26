Received: from mail.imc-berlin.de ([217.110.46.186])
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxQ4w-0001a4-4o
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 15:06:49 +0100
Message-ID: <42E64350.6060100@imc-berlin.de>
Date: Tue, 26 Jul 2005 16:06:08 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <dbl42b$hcn$1@sea.gmane.org>	<1121867130.12903.15.camel@localhost.localdomain>	<42E634D0.6090300@inf.u-szeged.hu>
	<42E63731.8010209@imc-berlin.de> <42E6432A.7030207@inf.u-szeged.hu>
In-Reply-To: <42E6432A.7030207@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
> Steven Scholz wrote:
> 
> 
>>Does writing "every relevant memory representation" significantly
>>increase umount time?
> 
> 
> It depends on many-many things. Just an example: with a 6M image (where
> there is a lot of small file) it costs 75K to write out.

So erasing and writing 2 64kB sectors on a normal NOR flash. Not much though. 
Compared with several seconds mount time ...

--
Steven
