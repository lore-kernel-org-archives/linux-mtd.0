Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178dJT-0005Cm-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 09:42:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020517083454.1C1582756@sitemail.everyone.net> 
References: <20020517083454.1C1582756@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: Quesion on copying to mtdblock0 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 May 2002 09:42:09 +0100
Message-ID: <13310.1021624929@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

zeusj@firstlinux.net said:
>  But I wrote a small program to tranfer the .b file into Big-endian
> Maybe I got something wrong in it... 

Exactly what does your program do? You can't just byte-swap all words or 
dwords in the whole image - you have to byteswap only the fields in the 
JFFS2 node headers that are larger than a byte. 

Unless your program had intimate knowledge of JFFS2 structure, it can't 
possibly have got it right.


--
dwmw2
