Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta04.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178HCg-0003C1-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 10:05:42 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Thu, 16 May 2002 02:05:38 -0700 (PDT)
From: Jim Zeus <zeusj@firstlinux.net>
To: David Woodhouse <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: Quesion on copying to mtdblock0
Reply-To: zeusj@firstlinux.net
Message-Id: <20020516090540.EB5162756@sitemail.everyone.net>
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


--- David Woodhouse <dwmw2@infradead.org> wrote:

>The flash is not completely erased, and doesn't contain _anything_ that 
>looks like valid JFFS2 data, so we don't erase it and start using it, 
>because you might have mounted the wrong partition.

Yes, you are right, and I think I have to apologize for my stupid question

>> I know the "Last[3] is 9da5, datum is 6246" message is to tell me that
>> what should be written is wrongly different from what be read from
>> flash,its a sanity check,but why a printk() can affects the Flash
>> write? 
>
>Timing? You definitely have flash driver problems. 

Just forget about it,its ok now.

>> 1.Is the command"cp jffs.img /dev/mtdblock0" after booting result as
>> same as to burn the jffs.img into flash chip(which is presented as
>> mtdblock0)with kernel Image? 
>
>Yes.

But I cant mount the jffs.img which was copied to mtdblock0(it has been *completely* erased) after booting.

What I mean is I can mount the mtdblock0 to /mnt, but after mounting,/mnt is still a empty directory,thought it should be many files and directories in it(because those are in jffs.img).I think the what the "mount" did is just find the long enough erased space in flash which is after the jffs.img and mount it on.
It may not recognize the jffs.img, what do you think about it?
And I took a same try with JFFS2, but I got "Magic bitmask not found"message then mount failed.Is seems to prove my conclusion.



_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
