Received: from web11106.mail.yahoo.com ([216.136.131.153])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16LvYN-0001SK-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2002 00:16:15 +0000
Message-ID: <20020103002709.33463.qmail@web11106.mail.yahoo.com>
Date: Wed, 2 Jan 2002 16:27:09 -0800 (PST)
From: Sheela Kashyap <sheela_kashyap@yahoo.com>
Subject: Re: (no subject) 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <24355.1010016371@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hmm... I will try mkfs.jffs again in that case. 

Well, by the time I was involved with the project, there had been
some work done on using jffs. But we'll be moving to Jffs2 in a short
while.

Thank you for your help.

Sheela.

--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> sheela_kashyap@yahoo.com said:
> >  While creating the jffs image using mkfs.jffs, I noticed that it
> did
> > not create all the /dev entries for me. I had to use 'mknod' and
> > create it manually on the target. What is the easiest way for me
> to
> > create a target image with all the /dev files? 
> 
> Er, not sure - mkfs.jffs ought to work. Why are you using jffs not
> jffs2?
> 
> --
> dwmw2
> 
> 


__________________________________________________
Do You Yahoo!?
Send your FREE holiday greetings online!
http://greetings.yahoo.com
