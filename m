Received: from web11106.mail.yahoo.com ([216.136.131.153])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Lv5I-0001Pf-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 Jan 2002 23:46:12 +0000
Message-ID: <20020102235704.27620.qmail@web11106.mail.yahoo.com>
Date: Wed, 2 Jan 2002 15:57:04 -0800 (PST)
From: Sheela Kashyap <sheela_kashyap@yahoo.com>
Subject: Re: (no subject) 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <14833.1009583578@redhat.com>
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

Thank you. I was the missing the root dev as you rightly guessed. I
am now successfully booting off mtd/jffs.

While creating the jffs image using mkfs.jffs, I noticed that it did
not create all the /dev entries for me. I had to use 'mknod' and
create it manually on the target. What is the easiest way for me to
create a target image with all the /dev files?

Thanks,
Sheela.

--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> sheela_kashyap@yahoo.com said:
> > everything is fine till it comes time to mount the root FS.It
> still
> > seems to try and go out on the net. This is the trace I see. I
> have
> > cut out some parts to reduce the clutter.  
> 
> A kernel that old doesn't have 'mtdblock' in the root_dev_names
> array in 
> init/main.c. Add it.
> 
> --
> dwmw2
> 
> 


__________________________________________________
Do You Yahoo!?
Send your FREE holiday greetings online!
http://greetings.yahoo.com
