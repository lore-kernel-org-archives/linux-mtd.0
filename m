Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Nvz4-00070U-00
	for mtd-list@infradead.org; Wed, 31 Jan 2001 12:03:34 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=executor.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Nvz2-00070O-00
	for mtd@infradead.org; Wed, 31 Jan 2001 12:03:33 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01C08B82.5716DF60@smithwicks.softsys.co.at> 
References: <01C08B82.5716DF60@smithwicks.softsys.co.at> 
To: Erwin Authried <eauth@softsys.co.at>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: MTD patches for 2.0 / 2.2 kernels 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jan 2001 12:03:28 +0000
Message-ID: <24053.980942608@fenrus.cambridge.redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


eauth@softsys.co.at said:
>  Wouldn' t it be much nicer to have a patch script (like patchin.sh),
> that  1. makes symlinks from the kernel source into the mtd tree, and
> 2. applies a very small patch for the kernel source  (init/main.c,
> drivers/Makefile, ...)

Yes, I think so too. Steven Hill, who generated the patches you're looking
at, had people asking for 'complete' patches. So that's what he produced.
But the 'infrastructure' patch would also be useful. It's just that the
existing ones were out of date, so we removed them.


eauth@softsys.co.at said:
>  I'd like to see all the patches inside the CVS distribution, instead
> of having them to download via ftp seperately. 

If they're only for the infrastructure, that's fine.

The complete patches were removed because they were too big.
The infrastructure patches were removed because they were out of date.

eauth@softsys.co.at said:
> Is there a special reason why there is a seperate link for  each mtd
> source file in patchin.sh, instead of having just one symbolic link
> for the mtd directory?

It's so that the CVS subdirectory of drivers/mtd/ can be different.

I tend to work with my main kernel tree for the board I'm working on ATM in 
CVS. Obviously I also have the MTD code in CVS. So I want to update the 
code in my build tree, I update the _original_ MTD CVS, go to the build 
tree, and 'cvs commit'. Sometimes I actually check it still works between 
those last two steps :)

It also means that when I have map drivers and strange partitioning schemes
for random boards that are under NDA, I can keep them in the internal CVS
tree without accidentally committing them to the public repository.

It does mean that you don't get new files automatically appearing in your 
build tree, but in general, you don't really need the new files unless 
you're starting to use new features, which isn't usually the case once your 
development is under way for a particular target.

But if you're volunteering to keep the 'infrastructure' patches and the 
patchin script up to date, you get to choose how it's done. I hardly touch 
2.2 kernel nowadays anyway, except when I make an effort to check my code 
still works on them.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
