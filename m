Date: Wed, 12 Jan 2005 16:22:43 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Lokesh Kumar <kumar.lokesh@wrx-us.com>
In-Reply-To: <294FD9D3403A0340BDAC38E48DCEFFDC935788@RES-EXCH>
Message-ID: <Pine.LNX.4.58.0501121621130.10617@phoenix.infradead.org>
References: <294FD9D3403A0340BDAC38E48DCEFFDC935788@RES-EXCH>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: how to behave on jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Jan 2005, Lokesh Kumar wrote:

This is feature of JFFS2. It works slow with directories which have lots 
of files. If you want to fix it, I may try to take you some hints :-)


> Hi All,
> 
> I have an embedded Linux (kernel 2.4.18) board at 50MHz, with jffs2 16MB
> flash. My system creates small files of 700 bytes each and is required to
> create ~3000 of such files. I see that when there are 1000 files, the system
> takes 3 minutes or so to mount this partition and then another 3 to do "ls
> -l". When there are 3000 files, the system takes 10 minutes each for mount
> and "ls -l". 
> 
> Is that expected behaviour?
> 
> Lokesh Kumar
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
