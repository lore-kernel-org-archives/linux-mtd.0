Received: from [200.53.172.166] (helo=qis)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gWb9-0005qo-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2001 20:20:00 +0100
Message-ID: <20010910183025.14865.qmail@qis>
References: <00d901c13a2c$ca16d2f0$c801a8c0@starticon>
In-Reply-To: <00d901c13a2c$ca16d2f0$c801a8c0@starticon> 
From: "Nikolai Vladychevski" <niko@isl.net.mx>
To: "Yunus Shaikh" <yshaikh@start-icon.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting doc2000 and mtd
Date: Mon, 10 Sep 2001 18:30:25 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Yunus Shaikh writes: 

> 
> Hello all 
> 
> i have managed to write data   in to the doc2000 , although
> i gives segmentation faults many times somehow i haev written it after
> restarting almost 50+ times now the problem is the root file system is
> mounted
> but does not go ahead i get a error mesage saying
> warning : unable to open an initial console 
> 
> i have tried passing init=/bin/sh parameter to the kernel
> any help ?

looks like /dev/console is missing, you will have to create your /dev with 
everything necesary. 

Nikolai 
