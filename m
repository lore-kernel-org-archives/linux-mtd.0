Received: from mailer.cse.iitd.ac.in ([202.141.68.3]
	helo=desh.cse.iitd.ernet.in)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D3EVd-0000Jr-8L
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2005 09:26:02 -0500
Message-ID: <4219EF6B.8040208@kritikalsolutions.com>
Date: Mon, 21 Feb 2005 19:55:47 +0530
From: Narinder Kumar <narinder@kritikalsolutions.com>
MIME-Version: 1.0
To: dedekind@infradead.org, linux-mtd@lists.infradead.org
References: <4219E20F.80908@kritikalsolutions.com>
	<1108994730.13420.52.camel@sauron.oktetlabs.ru>
In-Reply-To: <1108994730.13420.52.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

When the kernel boots it shows the message:
Creating 3 MTD partitions on "Atmel AT45DB642":
0x00000000-0x00108000 : "/dev/mtd/0"
0x00108000-0x00420000 : "/dev/mtd/1"
0x00420000-0x00840000 : "/dev/mtd/2"

and cat /proc/mtd prints out

dev:       size         erasesize    name
mtd0: 00108000 00000420  "/dev/mtd/0"
mtd1: 00318000 00000420  "/dev/mtd/1"
mtd2: 00420000 00000420  "/dev/mtd/2"



Artem B. Bityuckiy wrote:

>On Mon, 2005-02-21 at 18:58 +0530, Narinder Kumar wrote:
>  
>
>>mkfs.jffs2 -e 0x420 -d /tmp/Application -o image
>>    
>>
>
>Please, post the `cat /proc/mtd/` output.
>
>  
>
