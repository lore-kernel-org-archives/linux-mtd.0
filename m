Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJszY-00033L-AS
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 08:21:29 -0400
Message-ID: <4175065B.6040407@yandex.ru>
Date: Tue, 19 Oct 2004 16:19:39 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>
	<4173B404.6040100@yandex.ru> <4174C8EF.50604@inf.u-szeged.hu>
	<4174D508.8050508@yandex.ru> <4174E7D3.9050706@inf.u-szeged.hu>
	<4174F0F3.7030604@yandex.ru> <4175035B.80101@inf.u-szeged.hu>
In-Reply-To: <4175035B.80101@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 compression
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I undersand you, but unfortunatelly now there is no way to change 
> compression mode dimamically. There was (using procfs) but when David 
> tried to commit it to the kernel, someone (I don't remember who but one 
> of the kernel developers) declared it bad.
> 
> David asked me to reimplement it is sysfs, but that is not an easy 
> thing. Not technically. There is no fs subdirectory in sysfs. I read in 
> the mailling list archive of linux-fsdevel@vger.kernel.org. Someone 
> tried to submit a patch to make this fs subdirectory, because he need it 
> for NFS. The answer declared it as very bad, too... (sysfs has a 
> different philosopy...) I had some private discussion with the patch 
> submitter (what happened exactly, what was really the problem,... what 
> is his plan). He wrote that he try it again later. He think the guy who 
> declared his patch bad really hates sysfs (and procfs too). So I decided 
> to wait, too. :(
Ferenc, thanks for story, I really interested why the proc support was 
removed. There is another possibility - ioctl/fcntl. Ok, got it - it is 
not big deal to move compression mode to superblock, but now it is just 
unneeded because there are no interfaces to change the compression mode 
dynamically.
> 
> But this new "compressoin configuration" concept may cause that we don't 
> need sysfs/procfs.
How are you going to set files/directories compression mode (just 
interesting) ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
