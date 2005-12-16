Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EnIqu-0007wr-9S
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 11:54:42 -0500
Message-ID: <43A2F15A.6070407@mw-itcon.de>
Date: Fri, 16 Dec 2005 17:54:50 +0100
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: alfred hitch <alfred.hitch@gmail.com>
References: <43A1418F.3060701@imc-berlin.de>	
	<20051215102607.GA20431@angel.research.nokia.com>	
	<43A1609C.80705@imc-berlin.de> <43A166C6.5060803@mw-itcon.de>	
	<29f916510512151816v59b1f584h346a415b3888728@mail.gmail.com>	
	<43A2849E.8000907@mw-itcon.de>
	<29f916510512160836q21a0b585h9894990b0fc0d7f3@mail.gmail.com>
In-Reply-To: <29f916510512160836q21a0b585h9894990b0fc0d7f3@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

alfred hitch wrote:
> Hi Peter,
> 
> We happened to have our system in rw mode (dont ask me why,I will be
> embarassed).
> Now, we have made it ro.
> Files in question happened to be "sh"  or libc.so. etc.. basically one
> which appeared to be in memory at that time before kernel oops or
> sudden resets etc. So, to answer your question, yes they were from
> start there. After making ro as ofnow we havent seen any corruptions.
> But, my head has been looking for a reason as to why would it be
> executables be ever written back to flash ??
> 
I do not know exactly. But a question to the others: Does the wear 
leveling affect only free blocks, or does it reorganize seldom written 
used blocks too?

> Well jffs2 version we are using happened to be from snapgear 3.0 from
> net. so I am kinda biased and hoping we arent with a such a broken
> one.
> (How to update to latest btw ? 2.4 backwards compatible ?)
> 
> Didnt get this comment of ur's :
> 1. Single files can be still corrupted, when you write them and press reset.
> 
When you press reset, when a file is written, you get a partly written 
block. So you get a file, which is not written completely. This 
corruption is detected by jffs2 and issues warnings. The filesystem as 
whole stays intact, but the file as such doesn't have the contents you 
might expect.


Best regards
Peter

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
